<script setup>
import { useForm } from '@inertiajs/vue3';
import UserLayout from '../Layouts/UserLayout.vue';

const form = useForm({
    dateTime: '',
    from: '',
    to: '',
});

const submit = () => {
    form.post(route('trains.check'), {
        preserveScroll: true,
        onSuccess: (data) => {
            console.log(data);
            console.log('success');
        },
        onError: () => {
            console.log('error');
        },
    });
};

</script>

<template>
    <UserLayout title="Welcome">
        <div class="relative isolate px-6 pt-14 lg:px-8">            
            <div class="mx-auto max-w-2xl">
                <div class="text-center">
                    <span class="text-base font-semibold leading-7 text-indigo-600">RAIL SYSTEM</span>
                    <h1 class="text-4xl font-bold tracking-tight text-gray-900 sm:text-6xl">Check your trains</h1>
                    <p class="mt-6 text-lg leading-8 text-gray-600">

                    </p>
                    <div class="mt-10 flex items-center justify-center gap-x-6">
                        <div class="w-full">
                            <div class="mb-4 flex rounded-lg bg-red-50 p-4 text-sm text-red-800" role="alert">
                                <svg aria-hidden="true" class="mr-3 inline h-5 w-5 flex-shrink-0" fill="currentColor"
                                    viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                        d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z"
                                        clip-rule="evenodd"></path>
                                </svg>
                                <span class="sr-only">Danger</span>
                                <div>
                                    <span class="font-medium">Ensure that these requirements are met:</span>
                                    <ul class="mt-1.5 ml-4 list-inside list-disc">

                                        <li class="text-sm"></li>
                                    </ul>
                                </div>
                            </div>

                            <div>
                                <input type="text" v-model="form.from" />
                                <input type="text" v-model="form.to" />
                                <input type="datetime-local" v-model="form.dateTime" />
                                <button @click="submit()">
                                    <span>Check</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="absolute inset-x-0 top-[calc(100%-13rem)] -z-10 transform-gpu overflow-hidden blur-3xl sm:top-[calc(100%-30rem)]"
                aria-hidden="true">
                <div class="relative left-[calc(50%+3rem)] aspect-[1155/678] w-[36.125rem] -translate-x-1/2 bg-gradient-to-tr from-[#ff80b5] to-[#9089fc] opacity-30 sm:left-[calc(50%+36rem)] sm:w-[72.1875rem]"
                    style="clip-path: polygon(74.1% 44.1%, 100% 61.6%, 97.5% 26.9%, 85.5% 0.1%, 80.7% 2%, 72.5% 32.5%, 60.2% 62.4%, 52.4% 68.1%, 47.5% 58.3%, 45.2% 34.5%, 27.5% 76.7%, 0.1% 64.9%, 17.9% 100%, 27.6% 76.8%, 76.1% 97.7%, 74.1% 44.1%)">
                </div>
            </div>
        </div>


    </UserLayout>
</template>