package test.com.vinaysen.www

import com.vinaysen.www.io.CountStore
import com.vinaysen.www.resources.CounterResource
import org.mockito.Mockito.when

class CountResource extends UnitSpec {
  describe("CountingResources") {
    it("should return hit count to be 1 on init") {
      val countStore = mock[CountStore]
      when(countStore.incrementAndGet()).thenReturn(1)

      val resource = new CounterResource(countStore)

      assert(resource.incrementAndGet().getCount == 1)
    }

    it("should return hit count") {
      val countStore = mock[CountStore]
      when(countStore.incrementAndGet()).thenReturn(5)

      val resource = new CounterResource(countStore)

      assert(resource.incrementAndGet().getCount == 5)
    }
  }
}
