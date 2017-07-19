package com.vinaysen.www.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Count {
    private long count;

    public Count(long count) {
        this.count = count;
    }

    @JsonProperty
    public long getCount() {
        return count;
    }
}
