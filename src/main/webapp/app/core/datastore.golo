module core.data

import com.google.appengine.api.datastore.DatastoreService
import com.google.appengine.api.datastore.DatastoreServiceFactory
import com.google.appengine.api.datastore.Entity
import com.google.appengine.api.datastore.Key
import com.google.appengine.api.datastore.KeyFactory

function Store = -> DynamicObject()
    :service(|this|-> DatastoreServiceFactory.getDatastoreService())
    :entity(|this, entityName| -> Entity(entityName))


