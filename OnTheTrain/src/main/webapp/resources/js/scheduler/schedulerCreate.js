// 스케줄러 생성 페이지를 그리는 데 쓰이는 코드들입니다.

import { addModalModule } from "./schedulerModalModule.js";

const addedComponentList = $("#addedComponent");
const waitComponentList = $("#waitComponentList");
const noComponentArea = $("#noAddedComponentArea");
const waitDeleteModeBtn = $("#waitDeleteMode-button");
const schedulerCreateModule = {};

// 콘텍스트 패스 값을 세션에 저장하고 가져오기
function getContextPath() {
  return sessionStorage.getItem("contextpath");
}

const ctx = getContextPath();

// 현재 페이지에 표시될 요소 선택하기
function getCurrentComponent() {
  return sessionStorage.getItem("currentComponent");
}

// id 값으로 요소 객체 배열에서 요소 찾기
function findIndexById(arr, id) {
  for (let i = 0; i < arr.length; i++) {
    if (arr[i].id === id) {
      return i;
    }
  }
  // 해당 id 값을 가진 요소가 없을 경우 -1 반환
  return -1;
}

// 추가된 요소 영역과 관련된 함수
// 하나라도 요소가 추가되면 noComponent 가리기
function addedComponentListVisable() {
  noComponentArea.hide();
  addedComponentList.show();
}

// 요소가 없으면 noComponent 보이기
function noComponentAreaVisable() {
  noComponentArea.show();
}

// 추가 대기 중인 요소 삭제 모드 버튼
export var waitDeleteMode = false;

$(document).ready(function () {
  let currentComponent = getCurrentComponent();
  // 요소 클릭 시 해당 요소와 관련된 내용을 표시하도록 하는 함수
  $(".componentText").click(function () {
    var component = $(this).data("component");
    $.ajax({
      url: ctx + "/scheduler/component",
      type: "GET",
      data: { component: component },
      success: function (result) {
        // 세션에 currentComponent 값 저장
        sessionStorage.setItem("currentComponent", result.component);

        // 표시 요소 변경
        $(".componentName").text(result.name);

        // 아무 것도 없을 때 이미지 변경
        let imgUrl;

        switch (result.component) {
          case "event":
            imgUrl = "/images/scheduler/noEvent.png";
            break;
          case "accommodation":
            imgUrl = "/images/scheduler/noAccommodation.png";
            break;
          case "ticket":
            imgUrl = "/images/scheduler/noTicket.png";
            break;
        }

        $(".noComponentImg").css(
          "background-image",
          "url(" + ctx + imgUrl + ")"
        );
      },
      error: function () {
        alert("요청에 실패했습니다.");
      },
    });
  });

  // (일정) locationCode가 바뀔 때마다 실행되는 함수
  $("select[name='locationCode']").on("change", function () {
    var locationCode = $(this).val(); // 선택된 값 가져오기
    $.ajax({
      type: "GET",
      url: ctx + "/api/scheduler/events",
      data: { locationCode: locationCode }, // 선택된 값 전달
      dataType: "json",
      success: function (response) {
        if (response.length === 0) {
          // 반환값이 빈 객체리스트인 경우
          // 결과가 없음을 알리는 영역 표시
          $("#eventList").empty();
          $("#eventList").css("min-height", "unset");
          $("#noResultArea").show();
          return;
        }
        // 가져온 데이터를 이용해 이벤트 리스트를 만듦
        var eventList = "";
        $("#noResultArea").hide();
        for (var i = 0; i < response.length; i++) {
          // firstimage가 없는 경우 기본 이미지로 대체
          var imageUrl = response[i].firstimage
            ? response[i].firstimage
            : ctx + "/images/common/OnTheTrain_Logo.png";

          eventList +=
            "<div class='card'>" +
            "<div class='cardThumbnail'><img src='" +
            imageUrl +
            "'></div>" +
            "<div class='cardBrief'>" +
            "<div class='cardTitle'>" +
            response[i].title +
            "</div>" +
            "<div class='cardRequiredDetail'>" +
            response[i].addr1 +
            "</div>" +
            "<div class='cardOptionalDetail'>" +
            response[i].optionalDetail +
            "</div>" +
            "</div>" +
            "</div>";
        }
        $("#eventList").html(eventList); // 이벤트 리스트 업데이트
      },
      error: function () {
        alert("API로 이벤트를 가져오는 중에 문제가 발생했습니다.");
      },
    });
  });

  // 추가 대기 중인 요소 삭제 모드 버튼 클릭 이벤트
  waitDeleteModeBtn.on("click", () => {
    waitDeleteMode = !waitDeleteMode;
    if (waitDeleteMode) {
      $("#waitDeleteMode-button")
        .text("삭제모드ON")
        .addClass("delete-buttonOn");
      $("#deleteAllWait-button").show();
    } else {
      $("#waitDeleteMode-button")
        .text("삭제모드OFF")
        .removeClass("delete-buttonOn");
      $("#deleteAllWait-button").hide();
    }

    // 추가 대기 중인 요소 카드에 필터 추가
    const waitComponentCards = $("#waitComponentList .card");
    waitComponentCards.each((index, card) => {
      if (waitDeleteMode) {
        const filter = $("<div>")
          .addClass("componentFilter")
          .on("click", (event) => {
            event.stopPropagation();
            $(card).remove();
          });
        $(card).addClass("filtered");
        $(card).append(filter);
      } else {
        $(card).removeClass("filtered");
        $(card).find(".componentFilter").remove();
      }
    });
  });

  // 삭제 모드 활성화시 추가 대기 중인 요소 모두 삭제 버튼 이벤트
  $("#deleteAllWait-button").on("click", () => {
    if (confirm("정말로 모든 대기 중인 항목을 삭제하시겠습니까?")) {
      $(".filtered").remove();
      return;
    } else {
      return;
    }
  });

  /*
  $(document).on("DOMNodeInserted", ".card", function () {
    // 새로운 요소가 생성될 때마다 실행되는 이벤트 처리 함수

  */

  // 드래그 앤드 드롭 처리
  function setCardDraggable(card) {
    card.draggable({
      revert: true, // 드래그가 취소될 경우 원래 위치로 이동
      zIndex: 100, // 드래그 중인 요소의 z-index 값
      cursor: "move", // 드래그 커서 모양
      start: function (event, ui) {
        addedComponentListVisable();
      },
      stop: function (event, ui) {
        // 드래그가 종료될 때 실행될 콜백 함수
        if (addedComponentList.find(".card").length === 0) {
          // card 클래스를 가진 요소가 없는 경우
          noComponentAreaVisable();
        }
      },
    });
  }

  $("#noAddedComponentArea, #addedComponent, #waitComponentList").droppable({
    drop: function (event, ui) {
      event.stopPropagation();
      let draggable = ui.draggable;
      let id = draggable.attr("id");
      let droppable = $(event.target);
      let currentComponent = getCurrentComponent();
      let dropType = null; // droppable 된 영역을 구분할 변수

      // droppable된 영역에 따라 dropType 값을 설정
      if (droppable.is("#addedComponent")) {
        dropType = "addedComponent";
      } else if (droppable.is("#waitComponentList")) {
        dropType = "waitComponentList";
      } else {
        dropType = "noAddedComponentArea";
      }

      // dropType에 따라 다른 처리 실행
      if (dropType === "addedComponent") {
        setTimeout(() => {
          addModalModule.toAddedList(currentComponent, id);
        }, 1000);
      } else if (dropType === "waitComponentList") {
        setTimeout(() => {
          addModalModule.toWaitList(currentComponent, id);
        }, 1000);
      }

      // 드래그한 요소를 드롭 대상 요소의 자식으로 추가
      draggable.appendTo(droppable);

      // 현재 추가된 컴포넌트와 대기중인 컴포넌트 출력
    },
  });

  schedulerCreateModule.setCardDraggable = setCardDraggable;
});

// });

export {
  ctx,
  waitComponentList,
  addedComponentList,
  schedulerCreateModule,
  findIndexById,
  getCurrentComponent,
};
