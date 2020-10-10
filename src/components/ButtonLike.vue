<template>
  <div :class="$style.root" :style="{ color }">
    <svg
      xmlns="http://www.w3.org/2000/svg"
      viewBox="0 0 264 62"
      :class="$style.bg"
    >
      <path
        :fill="color"
        d="M246 59.999v-2h16V18.593L245.406 1.999H2v39.856l16.269 16.144H219v2H17.769L0 42.23V-.001h245.999l18.001 18v42h-18zm-16.756-3.86c.111.086.376.359.436.453a.798.798 0 01.128.444v.752a.798.798 0 01-.128.444c-.06.094-.325.358-.436.444a.81.81 0 01-.478.162l1.272 2.263h-.563l-1.264-2.263h-1.281v2.263h-.496v-5.124h2.306a.87.87 0 01.504.162zm-2.314.316v1.905h1.802a.287.287 0 00.145-.034c.136-.077.341-.265.418-.41.017-.034.017-.094.017-.145v-.718c0-.051 0-.111-.017-.145a1.343 1.343 0 00-.418-.427c-.043-.026-.094-.026-.145-.026h-1.802zm7.666.419a1.283 1.283 0 00-.41-.419.287.287 0 00-.145-.034h-.931a.283.283 0 00-.128.026c-.18.094-.47.41-.572.649l-.487-.145c.051-.12.128-.248.188-.333.119-.163.35-.427.529-.538a.934.934 0 01.444-.137h.965c.18 0 .376.06.513.162.111.086.367.359.427.453a.798.798 0 01.128.444v.598c0 .358-.239.64-.538.803l-1.785.956c-.154.085-.273.231-.273.401v.863h2.528v.478h-3.024v-1.383c0-.359.214-.615.547-.794l1.793-.957a.456.456 0 00.257-.393v-.555a.369.369 0 00-.026-.145zm3.436 3.766a.289.289 0 00.128.026h.957a.322.322 0 00.154-.034c.136-.077.324-.274.401-.419a.325.325 0 00.026-.137v-.973a.369.369 0 00-.026-.145 1.23 1.23 0 00-.401-.41.31.31 0 00-.154-.034h-1.896v-2.537h2.707v.478h-2.212v1.58h1.409c.18 0 .376.069.513.171.111.086.367.342.427.436a.798.798 0 01.128.444v.999a.798.798 0 01-.128.444c-.06.094-.316.367-.427.453a.896.896 0 01-.513.162h-.99a.927.927 0 01-.444-.137c-.18-.111-.41-.367-.53-.529a2.096 2.096 0 01-.196-.342l.495-.136c.12.23.393.546.572.64z"
      />
    </svg>
    <slot />
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
  name: "ButtonLike",
  props: {
    color: {
      type: String,
      default: "#0e0e0e",
    },
  },
});
</script>

<style module>
.root {
  cursor: pointer;
  touch-action: manipulation;
  display: block;
  width: 264px;
  height: 62px;
  position: relative;
  font-size: 20px;
  text-align: center;
  line-height: 62px;
  white-space: nowrap;
}

.root:active {
  transform: translate(1px, 1px);
}

.root > :not(.bg) {
  display: block;
  width: 100%;
  height: 100%;
  position: relative;
  z-index: 1;
  font-size: inherit;
  text-align: inherit;
  line-height: inherit;
  white-space: inherit;
}

.bg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 0;
}
</style>
