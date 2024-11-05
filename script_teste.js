import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  // Key configurations for Stress in this section
  stages: [
    { duration: '1m', target: 10 }, // traffic ramp-up from 1 to a higher 200 users over 10 minutes.
    { duration: '3m', target: 50 }, // stay at higher 200 users for 30 minutes
    { duration: '1m', target: 0 }, // ramp-down to 0 users
  ],
};

export default () => {
    const url = 'http://localhost/posts';
    const payload = JSON.stringify({
      title: 'Latindo',
      text: 'Aspernatur ipsa veritatis illum sed consectetur et. Consequatur recusandae ipsa sed facere.',
    });
  
    const params = {
      headers: {
        'Content-Type': 'application/json',
      },
    };
  
    http.post(url, payload, params);
    sleep(1);

};


