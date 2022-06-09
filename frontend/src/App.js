import './App.css';
import {useState, useEffect} from 'react';
import axios from 'axios';

function App() {

  const [msg, setMsg]= useState([]);

useEffect(()=>{
  axios.get(`https://8080-albimema-bootcampprojec-0cc5dyxmrak.ws-eu47.gitpod.io/api/rest/public/table/messages`)
    .then((response)=>{
      console.log(response);
      setMsg(response.data.chatroom_display_cache);
    })
    .catch(error => console.log(error))
},[]);

  console.log(msg);

  return (
    <div className="App">

      

<table class="styled-table">
        <thead>
          <tr>
            <th class="header">User</th>
            <th class="header">ChatName</th>
            <th class="header">Messages count</th>
            <th class="header">Last Message</th>
            <th class="header">Created at</th>
          </tr>
        </thead>
        <tbody>
        { msg.map((m, i) => (

<tr key={i}>
<td>{m.user_name}</td>
<td>{m.chatname}</td>
<td>{m.message}</td>
<td>{m.count}</td>
<td>{m.created_at}</td>
</tr>
        
        )) }
          
        </tbody>
      </table>
      
    </div>
  );
}

export default App;
