<template>
  <div>
    <div class="absolute top-4 right-4">
      <ThemeToggler />
    </div>
    <FlashMessages />
    <div class="min-h-screen flex items-center justify-center">
      <div class="mx-auto grid w-[350px] gap-6">
        <div class="grid gap-2 text-center">
          <h1 class="text-3xl font-bold">
            Forgot Password
          </h1>
          <p class="text-balance text-muted-foreground">
            Enter your email and we'll send you a link to reset your password.
          </p>
        </div>
        <form class="grid gap-4" @submit.prevent="sendResetLink">
          <div class="grid gap-2">
            <Label for="email">Email</Label>
            <Input
              id="email"
              type="email"
              placeholder="m@example.com"
              required
              v-model="form.email"
            />
            <p v-if="$page.props.errors.email" class="text-sm text-red-500">{{ $page.props.errors.email[0] }}</p>
          </div>
          <Button type="submit" class="w-full">
            Send reset link
          </Button>
        </form>
      </div>
    </div>
  </div>
</template>

<script setup>
import { reactive } from 'vue'
import { router } from '@inertiajs/vue3'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import FlashMessages from '@/components/FlashMessages.vue'
import ThemeToggler from '@/components/ThemeToggler.vue'

const form = reactive({
  email: ''
})

function sendResetLink() {
  router.post('/users/password', {
    user: {
      email: form.email
    }
  })
}
</script>
