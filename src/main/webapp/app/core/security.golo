module core.security

import core.users

struct secure = { foo }

augment core.security.types.secure {
    function admin = |this, if_admin, if_not_admin| {
        let user = currentUser()
        if user:loggedIn() and user:admin() {
            if_admin()
        } else {
            if_not_admin()
        }
    }
}
