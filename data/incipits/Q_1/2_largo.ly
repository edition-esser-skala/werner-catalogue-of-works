\version "2.24.2"
\include "header.ly"

\paper { indent = 1.5\cm }

ChalumeauI = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.
    d'8.( es!16) es8.( fis16) fis8.( g16)
    g4 r r
    d8.( es16) es!8.( h16) h8.( c16)
    c4 r r
    d2.~
  }
}

ChalumeauII = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
      R2.
    b'8.( c16) c8.( a16) a8.( b16)
    b4 r r
    h8.( c16) c8.( d16) d8.( es16)
    es4 r r
    b!2.
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    b''8-!\pp r g-! r d-! r
    b-! r r4 r
    b8-! r g-! r d-! r
    h-! r r4 r
    c''8-! r a-! r fis-! r
    d-! r b-! r b-! r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
      g''8-!\pp r d-! r b-! r
    g-! r r4 r
    g8-! r d-! r b-! r
    g-! r r4 r
    a''8-! r fis-! r c-! r
    b-! r g-! r g-! r
  }
}

Chords = {
  \relative c' {
    \clef soprano
    \key g \minor \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    s2.
    s
    s
    s
    s
    d16( g) b( g) d'( b) g( b) g( d) b( d)
  }
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    g'8-!\pp r g-! r g-! r
    g-! r r4 r
    g,8-! r g-! r g-! r
    g-! r r4 r
    fis'8-! r \hA fis-! r \hA fis-! r
    g-! r g-! r g-! r
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  <_!>
  <7- 5>
  r
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "chalumeau"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ChalumeauI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ChalumeauII
        }
      >>
    >>
    \new StaffGroup <<
      \new GrandStaff <<
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
