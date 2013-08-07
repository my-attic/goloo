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

    public List<Entity> getAll(String entityName, int limit) {
       return this.service.prepare(new Query(entityName)).asList(FetchOptions.Builder.withLimit(limit));
    }
    /*TODO: other query methods
        https://developers.google.com/appengine/docs/java/javadoc/com/google/appengine/api/datastore/FetchOptions
    */
    public Entity getById(String entityName, String uniqueID) throws EntityNotFoundException {

        Query q =new Query(entityName).addFilter("id", Query.FilterOperator.EQUAL,uniqueID);
        return this.service.prepare(q).asSingleEntity();
        //return this.service.prepare(q).asList(FetchOptions.Builder.withLimit(1)).get(0);

        //Query.FilterOperator.EQUAL
    }

    private String entityName = "";
    private int limit = 0;
    private String field = "";

    public Store get(String entityName, int limit) {
        this.entityName = entityName;
        this.limit = limit;
        return this;
    }

    public Store where(String field) {
        this.field = field;
        return this;
    }

    public List<Entity> isEqualTo(Object what) {
        Query q =new Query(this.entityName).addFilter(this.field, Query.FilterOperator.EQUAL,what);
        return this.service.prepare(q).asList(FetchOptions.Builder.withLimit(this.limit));
    }

    public List<Entity> isNotEqualTo(Object what) {
        Query q =new Query(this.entityName).addFilter(this.field, Query.FilterOperator.NOT_EQUAL,what);
        return this.service.prepare(q).asList(FetchOptions.Builder.withLimit(this.limit));
    }

    public List<Entity> isIn(Object what) {
        Query q =new Query(this.entityName).addFilter(this.field, Query.FilterOperator.IN,what);
        return this.service.prepare(q).asList(FetchOptions.Builder.withLimit(this.limit));
    }

    public List<Entity> isGreaterThan(Object what) {
        Query q =new Query(this.entityName).addFilter(this.field, Query.FilterOperator.GREATER_THAN,what);
        return this.service.prepare(q).asList(FetchOptions.Builder.withLimit(this.limit));
    }

    public List<Entity> isGreaterOrEqualThan(Object what) {
        Query q =new Query(this.entityName).addFilter(this.field, Query.FilterOperator.GREATER_THAN_OR_EQUAL,what);
        return this.service.prepare(q).asList(FetchOptions.Builder.withLimit(this.limit));
    }

    public List<Entity> isLessThan(Object what) {
        Query q =new Query(this.entityName).addFilter(this.field, Query.FilterOperator.LESS_THAN,what);
        return this.service.prepare(q).asList(FetchOptions.Builder.withLimit(this.limit));
    }

    public List<Entity> isLessOrEqualThan(Object what) {
        Query q =new Query(this.entityName).addFilter(this.field, Query.FilterOperator.LESS_THAN_OR_EQUAL,what);
        return this.service.prepare(q).asList(FetchOptions.Builder.withLimit(this.limit));
    }


    public Key put(Entity entity) {
        return this.service.put(entity);
    }

    public void delete(Entity entity) {
        this.service.delete(entity.getKey());
    }

    public Store() {
        this.service = DatastoreServiceFactory.getDatastoreService();
    }
}
