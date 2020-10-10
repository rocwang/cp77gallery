<template>
  <h1 :class="$style.root">
    <Logo />
    <span :class="$style.cyberpunk">Cyberpunk</span>
    <small :class="$style.text2077">2077</small>
    <span :class="$style.gallery">&mdash; Gallery</span>
  </h1>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import Logo from "@/components/Logo.vue";

export default defineComponent({
  name: "Title",
  components: { Logo },
});
</script>

<style module>
.root {
  padding: 15px;
  text-align: right;
  background-color: var(--color-cp77-black);
}

.cyberpunk,
.text2077 {
  visibility: hidden;
}

.gallery {
  color: var(--color-cp77-yellow);
}
</style>
