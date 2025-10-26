\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 3/8 \tempoMarkup "Allegro"
    \partial 8 a'8\f d fis d
    a' h a
    fis d e
    a,4 a,8
    d fis d
    a' h a
    fis d e
    a,4 a''8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 3/8 \tempoMarkup "Allegro"
    \partial 8 a'8\f d fis d
    a' h a
    fis d e
    a,4 a,8
    d fis d
    a' h a
    fis d e
    a, a'16 h cis d
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key d \major \time 3/8 \tempoMarkup "Allegro"
    \partial 8 a8\f d fis d
    a' h a
    fis d e
    a,4 a8
    d fis d
    a' h a
    fis d e
    a,16 h cis d e d
  }
}

Chords = {
  \relative c' {
    \clef treble
    \key d \major \time 3/8 \tempoMarkup "Allegro"
    \partial 8 a'8 d fis d
    a' h a
    fis d e
    a,4 a,8
    d fis d
    a' h a
    fis d e
    a,4 << { e''8 } \\ { cis } >>
  }
}

Organo = {
  \relative c {
    \clef bass
    \clef alto \key d \major \time 3/8 \tempoMarkup "Allegro"
    \partial 8 a'8-\tutti d fis d
    a' h a
    fis d e
    a,4 \clef bass a,8
    d fis d
    a' h a
    fis d e
    a, a a
  }
}

BassFigures = \figuremode {
  %tacet
}

\score {
  <<
    \new StaffGroup <<
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
    \new PianoStaff <<
      \set PianoStaff.instrumentName = \markup \center-column { "org" "solo" }
      \new Staff { \Chords }
      \new Staff {
        \set Staff.instrumentName = "b"
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
