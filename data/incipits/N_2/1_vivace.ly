\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Vivace"
    \partial 8 a'8 d fis16 d a'8 e16 cis d4 r8 a
    d16( e) fis( d) a'( h) e,( cis) d( d,) fis'( d,) e'( d,) fis'( d,)
    d'( d,) g'( d,) e'( d,) fis'( d,) d'( d,) fis'( d,) e'( d,) fis'( d,)
    d'( d,) g'( d,) e'( d,) fis'( d,) d'8(-. d-.) d(-. d-.)
    d(-. d-.) d(-. d-.) d16( e) fis( d) g( e) fis( cis)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Vivace"
    \partial 8 r8 r4 r8 a d fis16 d a'8 e16 cis
    d4 r8 e fis a g a
    fis h g a fis a g a
    fis h g a fis16( g) a( fis) g( e) fis( e)
    fis( g) a( fis) g( e) fis( e) d8(-. d-.) d(-. d-.)
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \tempoMarkup "Vivace"
    \partial 8 a8 d fis16 d a'8 e16 cis d4 r8 a
    d16( e) fis( d) a'( g) g( e) d8 fis e fis
    d g e fis d fis e fis
    d g e fis d(-. d-.) d(-. d-.)
    d(-. d-.) d(-. d-.) fis16( g) a( fis) h( g) fis( e)
  }
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Vivace"
    \partial 8 r8 d4 r8 a' d,4 r8 a
    d,4 r8 a' d2~-\tasto
    d1~
    d2 d16-\markup \remark "alla 8va" e fis d g e fis cis
    d e fis d g e fis cis d2
  }
}

BassFigures = \figuremode {
  r8 r1
  r
  r
  r2. <8>16 q q q
  q q q q q q q q r2
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
