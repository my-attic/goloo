package org.k33g.goloo.store;


import com.google.appengine.api.datastore.*;

import java.util.List;


/*
https://developers.google.com/appengine/docs/java/datastore/entities

*/
public class Store {
    private DatastoreService service;

    public Entity entity(String entityName) {
        String uniqueID = java.util.UUID.randomUUID().toString();
        Entity e = new Entity(entityName);
        e.setProperty("id", uniqueID);
        return e;
    }

    public Entity entity(String entityName, String id) {
        return new Entity(entityName, id);
    }

    public List<Entity> query(String entityName, int limit) {
       return this.service.prepare(new Query(entityName)).asList(FetchOptions.Builder.withLimit(limit));
    }
    /*TODO: other query methods
        https://developers.google.com/appengine/docs/java/javadoc/com/google/appengine/api/datastore/FetchOptions
    */

    public Key put(Entity entity) {
        return this.service.put(entity);
    }

    public void delete(Entity entity) {
        this.service.delete(entity.getKey());
    }

    public Entity getById(String entityName, String uniqueID) throws EntityNotFoundException {

        Query q =new Query(entityName).addFilter("id", Query.FilterOperator.EQUAL,uniqueID);
        return this.service.prepare(q).asSingleEntity();
        //return this.service.prepare(q).asList(FetchOptions.Builder.withLimit(1)).get(0);
    }

    public Store() {
        this.service = DatastoreServiceFactory.getDatastoreService();
    }
}
