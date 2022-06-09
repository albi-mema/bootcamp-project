import './App.css';
import {useState, useEffect} from 'react';
import axios from 'axios';
import moment from "moment";


function App() {

  const [msg, setMsg]= useState([]);

useEffect(()=>{
  axios.get(`https://8080-albimema-bootcampprojec-0cc5dyxmrak.ws-eu47.gitpod.io/api/rest/public/table/message`)
    .then((response)=>{
      console.log(response);
      setMsg(response.data.chatroom_display_cache);
    })
    .catch(error => console.log(error))
},[]);

  console.log(msg);

  return (
    <div className="App">

      

<table className="styled-table">
        <thead>
          <tr>
            <th className="header">User</th>
            <th className="header">ChatName</th>
            <th className="header">Messages count</th>
            <th className="header">Last Message</th>
            <th className="header">Created at</th>
          </tr>
        </thead>
        <tbody>
        { msg.map((m, i) => (

<tr key={i}>
<td>{m.user_name}</td>
<td>{m.chatname}</td>
<td>{m.message}</td>
<td>{m.count}</td>
<td>({ moment(m.created_at).fromNow()})</td>
</tr>
        
        )) }
          
        </tbody>
      </table>
      
    </div>
  );
}

export default App;
