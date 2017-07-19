package integration.com.vinaysen.www

import com.vinaysen.www.io.CountStore
import com.vinaysen.www.resources.CounterResource
import org.mockito.Mockito.when

class CountResource extends IntegrationSpec {
  describe("CountingResources") {
    it("should return hit count to be 1 on init") {
      val resource = new CounterResource(new CountStore)

      assert(resource.incrementAndGet().getCount == 1)
    }

    it("should return hit count") {
      val countStore = new CountStore

      val resource = new CounterResource(countStore)

      assert(resource.incrementAndGet().getCount == 1)
      assert(resource.incrementAndGet().getCount == 2)
      assert(resource.incrementAndGet().getCount == 3)
      assert(resource.incrementAndGet().getCount == 4)
    }
  }
}
