

@Component()
class MyComponent {
  MyComponent(@Pane DirectiveQuery<Pane> panes);

}

@Component(
  parentQueryVisibility: Visibility.CHILDREN
  queryVisibility: QueryVisibility.NONE|PARENT|ANCESTOR;
)
class Pane {

}


new Key(QueryList, Pane)


<div>
  <video></video>
</div>

@Decorator(selector: 'video', queryVisibility: QueryVisibility.ANCESTOR)
class Video {
  Video(MyComponent c)
}

class MyComponent {
  ShadowDirectiveQuery<dom.VideoElement> videos;
  
  MyComponent(this.videos) {
    assert(videos.length == 0);
    videos.onInsert((delta) {
      // doSomething
    });
  }
  
  onClick(..) {
    videos.forEach((v) => v.play());
  }
}


DirectChildQuery<Pane>
ChildQuery<Pane>


class Tabs {
  Tabs(@children DirectiveQuery<Pane> panes)
}


class Pane {
  Pane(@parent Tabs tabs)
}

class Form {
  Form(@ancestor Form parentForm);
}



  /**
   * A directive/component controller class can be injected into other
   * directives/components. This attribute controls whether the
   * controller is available to others.
   *
   * * `local` [Directive.LOCAL_VISIBILITY] - the controller can be injected
   *   into other directives / components on the same DOM element.
   * * `children` [Directive.CHILDREN_VISIBILITY] - the controller can be
   *   injected into other directives / components on the same or child DOM
   *   elements.
   * * `direct_children` [Directive.DIRECT_CHILDREN_VISIBILITY] - the
   *   controller can be injected into other directives / components on the
   *   direct children of the current DOM element.
   */
  final Visibility visibility;
  