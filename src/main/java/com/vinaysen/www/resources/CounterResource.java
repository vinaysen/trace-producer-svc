package com.vinaysen.www.resources;

import com.codahale.metrics.annotation.Timed;
import com.vinaysen.www.io.CountStore;
import com.vinaysen.www.model.Count;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/counter")
@Produces(MediaType.APPLICATION_JSON)
public class CounterResource {
    private final CountStore countStore;

    public CounterResource(CountStore countStore) {
        this.countStore = countStore;
    }

    @GET
    @Timed
    public Count incrementAndGet() {
        return new Count(countStore.incrementAndGet());
    }
}
