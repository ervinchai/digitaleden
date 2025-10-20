<template>
  <div class="p-6">
    <h1 class="text-2xl font-bold">Dashboard</h1>
    <p class="mt-2" v-if="$page.props.auth.user">Welcome, {{ $page.props.auth.user.email }}</p>

    <button @click="logout" class="mt-4 bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">
      Logout
    </button>
  </div>
</template>

<script setup>
import { router } from '@inertiajs/vue3'

function logout() {
  router.delete('/users/sign_out')
}
</script>
