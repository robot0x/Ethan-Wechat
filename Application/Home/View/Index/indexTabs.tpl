<script id="templates/indexTabs.html" type="text/ng-template">
      <ion-tabs class="tabs-icon-top tabs-stable  tabs-color-active-positive">

        <ion-tab title="首页" icon="ion-shouye" href="#/tab/home">
          <ion-nav-view name="home-tab"></ion-nav-view>
        </ion-tab>

        <ion-tab title="搜周边" icon="ion-lbs" href="#/tab/rim">
          <ion-nav-view name="rim-tab"></ion-nav-view>
        </ion-tab>

        <ion-tab title="活动" icon="ion-unie637" href="#/tab/activity">
          <ion-nav-view name="activity-tab"></ion-nav-view>
        </ion-tab>

        <ion-tab title="个人中心" icon="ion-studyuser" href="#/tab/personal">
          <ion-nav-view name="personal-tab"></ion-nav-view>
        </ion-tab>

      </ion-tabs>
    </script>
