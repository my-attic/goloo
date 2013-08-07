module core.users

import com.google.appengine.api.users.UserService
import com.google.appengine.api.users.UserServiceFactory


struct user = {userService}

augment core.users.types.user {
    function loggedIn = |this| -> this:userService():isUserLoggedIn()
    function admin = |this| -> this:userService():isUserAdmin()
    function nickName = |this| -> this:userService():getCurrentUser():getNickname()
    function email = |this| -> this:userService():getCurrentUser():getEmail()
    function id = |this| -> this:userService():getCurrentUser():getUserId()

    function logoutUrl = |this, uri| -> this:userService():createLogoutURL(uri)
    function loginUrl = |this, uri| -> this:userService():createLoginURL(uri)
}

function currentUser = -> user(UserServiceFactory.getUserService())
