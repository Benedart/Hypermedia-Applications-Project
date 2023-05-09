<script setup lang="ts">
import { makeCall } from '@/utils/common'
</script>

<template>
    <div>
        <div class="dropdown">
            <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"
                data-bs-auto-close="outside">
                Filter Areas
            </button>
            <form class="dropdown-menu p-4">
                <div class="hstack gap-3">
                    <div class="filter-col bg-light border">
                        Types
                        <hr>
                        <div v-for="typeo in types" class="form-check">
                            <input class="form-check-input" name="typeSelector" type="checkbox" :value="typeo" :id="typeo">
                            <label class="form-check-label" :for="typeo">
                                {{ typeo }}
                            </label>
                        </div>
                    </div>
                    
                </div>
                <hr>
                <button @click="applyFilters()" type="button" class="btn btn-primary">Apply</button>
                <button type="reset" class="btn btn-secondary">Clear all</button>
            </form>
        </div>
    </div>
</template>

<script lang="ts">
export default {
    data() {
        return {
            types: [],
        }
    },

    created() {
        this.getFilters()
    },

    methods: {
        applyFilters: function () {
            let typeSelector = document.getElementsByName("typeSelector")


            let selectedTypes: string[] = []

            for (let i = 0; i < typeSelector.length; i++) {
                if (typeSelector[i].checked) {
                    selectedTypes.push(typeSelector[i].value)
                }
            }

            let filters = {
                types: selectedTypes,
               
            }

            this.$emit("applyFilters", filters)
        },

        getFilters: function () {
            // get all the types
            makeCall("GET", import.meta.env.VITE_APP_URL + "/getTypes",
                (req) => {
                    if (req.readyState === 4) {
                        let message = req.responseText;

                        if (req.status === 200) {
                            let data = JSON.parse(message);
                            this.types = data.map((type: { type: number; }) => type.type)

                        } else {
                            alert("Error, couldn't get the types");
                        }
                    }
                }
            )

        }
    }

}
</script>

<style scoped>
.dropdown-menu {
    height: 50vh;
    overflow-y: auto;
}
</style>
