\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \dorian \time 3/2 \tempoMarkup "Larg[hett]o"
    a'4( d) f2 \tuplet 3/2 { e4( f g) }
    g2( f) e4( f)
    g2 f es
    d cis4( e) a,2~
    a g f
    f4( e) e2 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \dorian \time 3/2 \tempoMarkup "Larg[hett]o"
    f2 a4( d) \tuplet 3/2 { cis( d e) }
    e2( d) cis
    d c b
    a g f
    e1\trill d2
    d4( cis) cis2 r
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key d \dorian \time 3/2 \tempoMarkup "Larg[hett]o"
    d1 a'2
    r d, a
    b' a g
    f e d
    cis1 d2
    a1 r2
  }
}

Organo = {
  \relative c {
    \clef alto
    \key d \dorian \time 3/2 \tempoMarkup "Larg[hett]o"
    d'1-\markup \remark "vlne tacet" a'2
    r d, a
    b' a g
    f e d
    cis1 d2
    a1 r2
  }
}

BassFigures = \figuremode {
  r1 <_+>2
  r1 q2
  <6> q <6->
  <6> <6\\>1
  <6>2 <5>1
  <6 4>2 <5 _+>1
}

\score {
  <<
    \new StaffGroup \with { \smallGroupDistance } <<
      \new GrandStaff \with { \smallGroupDistance } <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
      \new Staff {
        \set Staff.instrumentName = "vla"
        \Viola
      }
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
