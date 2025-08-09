package release

# deny if any High or Critical CVE exists in scanner output
high_or_crit[v] {
  some i
  input.matches[i].vulnerability.severity == "High"
  v := input.matches[i]
}
high_or_crit[v] {
  some i
  input.matches[i].vulnerability.severity == "Critical"
  v := input.matches[i]
}

allow {
  count(high_or_crit) == 0
}
