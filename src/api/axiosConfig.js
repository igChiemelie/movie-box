import axios from 'axios';

export default axios.create({
    baseURL:'http://54.90.202.148:8080',
    headers: {
        'Content-Type': 'application/json',
    },
});