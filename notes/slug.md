- In our case, using find_each method allows us to query records in batches,
  thereby increasing the efficiency.
- Since set_slug is a private method in our Task model, it is not accessible to
  the task objects we are calling the method on.
- before_create :set_slug

```
    def slug_not_changed
      if slug_changed? && self.persisted?
        errors.add(:slug, 'is immutable!')
      end
    end
```
