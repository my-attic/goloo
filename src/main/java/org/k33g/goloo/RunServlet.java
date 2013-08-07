package org.k33g.goloo;

import com.google.common.base.Charsets;
import com.google.common.io.CharStreams;
import org.k33g.goloo.tools.ScriptsLoader;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;


public class RunServlet extends HttpServlet {

    private ScriptsLoader scriptsLoader = new ScriptsLoader((new File("app")).getAbsolutePath());

    private Object callRouter(String verb, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Object ret = null;

        InputStreamReader reader = new InputStreamReader(req.getInputStream(), Charsets.UTF_8);
        String data = CharStreams.toString(reader);

        try {
            ret = scriptsLoader.module("/core/router.golo")
                    .method("router", Object.class, Object.class, Object.class, Object.class)
                    .run((Object) verb, (Object) req, (Object) resp, (Object) data);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return ret;
        }
    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        this.callRouter("GET", req, resp);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        this.callRouter("POST", req, resp);
    }

    public void doPut(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        this.callRouter("PUT", req, resp);
    }

    public void doDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        this.callRouter("DELETE", req, resp);
    }

    public void init() {
        try {
            /* Load all external golo scripts (in app directory) */
            scriptsLoader.loadAll();
            scriptsLoader.module("/boot.golo")
                    .method("boot", Object.class)
                    .run((Object) null);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
