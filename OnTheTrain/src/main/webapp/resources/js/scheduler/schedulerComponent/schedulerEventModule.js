import { ctx } from "../schedulerCreate.js";
import { addModalModule } from "../schedulerModalModule.js";
import { findIndexFromArrayById } from "../schedulerCreate.js";

// event 객체를 관리할 배열 생성
const addedEvents = [];
const waitEvents = [];
const APIEvents = [];

// CREATE 관련
// event 객체의 ID값을 관리할 함수 정의
function createEventId() {
  return "event_" + Date.now() + Math.floor(Math.random() * 1000);
}
// 일정 객체 생성 함수 정의
function createEventObject(fields) {
  const { title, location, startTime, endTime, price, details, previewImage } =
    fields;

  const event = {
    id: createEventId(),
    component: "event",
    title: title.val(),
    location: location.val(),
    startTime: startTime.val(),
    endTime: endTime.val(),
    price: price.val(),
    details: details.val(),
    image: previewImage.attr("src"),
  };

  return event;
}
// API로 받아오는 객체 함수 정의
function createAPIEventObject(APIEventINFO, imageUrl) {
  const APIEvent = {
    id: createEventId(),
    addr1: APIEventINFO.addr1 || "",
    addr2: APIEventINFO.addr2 || "",
    booktour: APIEventINFO.booktour || "",
    cat1: APIEventINFO.cat1 || "",
    cat2: APIEventINFO.cat2 || "",
    cat3: APIEventINFO.cat3 || "",
    contentid: APIEventINFO.contentid || "",
    contenttypeid: APIEventINFO.contenttypeid || "",
    createdtime: APIEventINFO.createdtime || "",
    eventstartdate: APIEventINFO.eventstartdate || "",
    eventenddate: APIEventINFO.eventenddate || "",
    firstimage: APIEventINFO.firstimage || "",
    firstimage2: APIEventINFO.firstimage2 || "",
    cpyrhtDivCd: APIEventINFO.cpyrhtDivCd || "",
    mapx: APIEventINFO.mapx || "",
    mapy: APIEventINFO.mapy || "",
    mlevel: APIEventINFO.mlevel || "",
    modifiedtime: APIEventINFO.modifiedtime || "",
    areacode: APIEventINFO.areacode || "",
    sigungucode: APIEventINFO.sigungucode || "",
    tel: APIEventINFO.tel || "",
    title: APIEventINFO.title || "",
    imageUrl: imageUrl || "",
  };

  return APIEvent;
}
function transAPIobjToEvent(apievent) {
  const event = {
    id: createEventId(),
    component: "event",
    title: apievent.title,
    location: apievent.addr1,
    startTime: apievent.eventstartdate,
    endTime: apievent.eventenddate,
    price: 0,
    details: apievent.tel,
    image: apievent.firstimage,
  };

  return event;
}

// READ 관련
/**
 * id로 이벤트 찾기
 * @param {string} id  이벤트 아이디
 * @returns {object} 이벤트 오브젝트
 */
function findEventById(id) {
  let foundEvent = addedEvents.find((event) => event.id === id);

  if (foundEvent) {
    return foundEvent;
  }

  foundEvent = waitEvents.find((event) => event.id === id);

  if (foundEvent) {
    return foundEvent;
  }

  foundEvent = APIEvents.find((event) => event.id === id);

  if (foundEvent) {
    return foundEvent;
  } else {
    console.log(`해당 id를 가진 일정이 없습니다`);
    return null;
  }
}
/**
 * 배열에서 id로 이벤트 찾기
 * @param {array} 첫번째 파라미터 아이디를 찾을 배열
 * @param {string} id  이벤트 아이디
 * @returns {object} 이벤트 오브젝트
 */
function findEventFromArrayById(array, id) {
  let foundEvent = array.find((event) => event.id === id);

  if (foundEvent) {
    return foundEvent;
  } else {
    console.log(`해당 id를 가진 일정이 없습니다`);
    return null;
  }
}
/**
 *
 * @param {eventid} id 아이디를 받아
 * @returns {obj} 위치한 array와 index값을 반환
 */
function getEventArrayAndIndexById(id) {
  let array, index;
  let arrayAndIndex = { array, index };

  // addedEvents 배열에서 찾기
  for (let i = 0; i < addedEvents.length; i++) {
    if (addedEvents[i].id === id) {
      arrayAndIndex.array = addedEvents;
      arrayAndIndex.index = i;
      return arrayAndIndex;
    }
  }

  // waitEvents 배열에서 찾기
  for (let i = 0; i < waitEvents.length; i++) {
    if (waitEvents[i].id === id) {
      arrayAndIndex.array = waitEvents;
      arrayAndIndex.index = i;
      return arrayAndIndex;
    }
  }

  // APIEvents 배열에서 찾기
  for (let i = 0; i < APIEvents.length; i++) {
    if (APIEvents[i].id === id) {
      arrayAndIndex.array = APIEvents;
      arrayAndIndex.index = i;
      return arrayAndIndex;
    }
  }

  console.log(`해당 id를 가진 일정이 없습니다`);
  return null;
}
// resetModal 함수 정의
function resetEventModal() {
  $("#event-title").val("");
  $("#event-location").val("");
  $("#event-start-time").val("");
  $("#event-end-time").val("");
  $("#event-price").val("");
  $("#event-details").val("");
  $(".image-upload").val("");
  $("#schedulerEventModal .preview-image").attr(
    "src",
    ctx + "/images/common/OnTheTrain_Logo.png"
  );
  $("#schedulerEventModal .image-caption").text("이미지 등록");
}
//renderEventOnModal 함수 정의
function renderEventOnModal(event) {
  // 모달 창에 필드 값을 입력.
  $("#schedulerEventModalView .componentId").text(event.id);
  $("#eventTitle_view").text(event.title || "내용 없음");
  $("#eventLocation_view").text(event.location || "내용 없음");
  $("#eventStartTime_view").text(event.startTime || "내용 없음");
  $("#eventEndTime_view").text(event.endTime || "내용 없음");
  $("#eventPrice_view").text(event.price || "내용 없음");
  $("#eventDetails_view").text(event.details || "내용 없음");

  if (event.image) {
    $("#preview-image_view").attr("src", event.image);
    $("#schedulerEventModalView .image-caption>a").attr({
      href: event.image,
      target: "_blank",
    });
  } else {
    $("#schedulerEventModalView .image-caption a").attr("href", "#");
  }
}
//API 컨텐츠를 뷰모달에 그리기
function renderAPIEventOnModal(event) {
  // 모달 창에 필드 값을 입력.
  $("#eventTitle_view").text(event.title || "내용 없음");
  $("#eventLocation_view").text(event.addr1 || "내용 없음");
  $("#eventStartTime_view").text(event.eventstartdate || "내용 없음");
  $("#eventEndTime_view").text(event.eventenddate || "내용 없음");
  $("#eventPrice_view").text(event.price || "내용 없음");
  $("#eventDetails_view").text(event.tel || "내용 없음");

  if (event.imageUrl) {
    $("#preview-image_view").attr("src", event.imageUrl);
    $("#schedulerEventModalView .image-caption>a").attr({
      href: event.imageUrl,
      target: "_blank",
    });
  } else {
    $("#schedulerEventModalView .image-caption a").attr("href", "#");
  }
}

// UPDATE 관련

function editEvent(obj) {
  let field = addModalModule.getAddModalComponents()["event"].fields;
  const { title, location, startTime, endTime, price, details, previewImage } =
    field;

    obj.title = title.val(),
    obj.location = location.val(),
    obj.startTime = startTime.val(),
    obj.endTime = endTime.val(),
    obj.price = price.val(),
    obj.detail = details.val(),
    obj.image = previewImage.attr("src")
  
  return obj;
}

// 추가된 일정으로 이벤트 객체를 옮기는 함수
function toAddedEvent(id) {
  let arrayfrom = addedEvents;
  // 해당 요소가 있었던 곳 찾기
  let idx = findIndexFromArrayById(addedEvents, id);
  if (idx === -1) {
    arrayfrom = waitEvents;
    idx = findIndexFromArrayById(waitEvents, id);
  }
  let targetEvent = arrayfrom.splice(idx, 1)[0];
  addedEvents.push(targetEvent);
}
// 대기 중인 일정으로 이벤트 객체를 옮기는 함수
function toWaitEvent(id) {
  let arrayfrom = addedEvents;
  // 해당 요소가 있었던 곳 찾기
  let idx = findIndexFromArrayById(addedEvents, id);
  if (idx === -1) {
    arrayfrom = waitEvents;
    idx = findIndexFromArrayById(waitEvents, id);
  }

  let targetEvent = arrayfrom.splice(idx, 1)[0];
  waitEvents.push(targetEvent);
}
// 이벤트 객체 값으로 추가 모달 필드 구성
function setAddModalByEvent(modalEvent) {
  $("#event-title").val(modalEvent.title);
  $("#event-location").val(modalEvent.location);
  $("#event-start-time").val(modalEvent.startTime);
  $("#event-end-time").val(modalEvent.endTime);
  $("#event-price").val(modalEvent.price);
  $("#event-details").val(modalEvent.details);
  $(".image-upload").val("");
  $("#schedulerEventModal .preview-image").attr("src", modalEvent.image);
  $("#schedulerEventModal .image-caption").text("이미지 등록");
}

// DELETE 관련
// 아이디로 이벤트 객체 제거
function removeEventById(id) {
  let arrayAndIndex = getEventArrayAndIndexById(id);
  if ($(arrayAndIndex)) {
    // arrayAndIndex와 arrayAndIndex.array가 모두 있는지 확인
    let array = arrayAndIndex.array;
    let index = arrayAndIndex.index;

    array.splice(index, 1);
  } else {
    console.log(`해당 id를 가진 일정이 없습니다`);
  }
}
// 추가된 일정이나 대기 중인 일정에서 이벤트 객체를 제거하는 함수
function removeEventFromArray(arr, id) {
  let idx = findIndexFromArrayById(arr, id);

  if (idx !== -1) {
    arr.splice(idx, 1);
  }
}

export {
  waitEvents,
  addedEvents,
  APIEvents,
  editEvent,
  toWaitEvent,
  toAddedEvent,
  createEventId,
  findEventById,
  resetEventModal,
  removeEventById,
  createEventObject,
  renderEventOnModal,
  transAPIobjToEvent,
  setAddModalByEvent,
  createAPIEventObject,
  removeEventFromArray,
  renderAPIEventOnModal,
  findEventFromArrayById,
  getEventArrayAndIndexById,
};
