library change_detection.change_detector;

/**
 * Represents the top level interface to detecting changes.
 */
class ChangeDetector {
  /**
   * Runs the change detection and delivers the changes. 
   * 
   * Returns number of changes detected
   */
  int detectChanges();
}
