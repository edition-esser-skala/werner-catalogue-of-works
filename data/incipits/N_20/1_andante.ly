\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Andante"
    \partial 8 a'8\f d e fis g a4 fis8 d
    a'16( h) a8 fis d a'4 r8 a,,
    d e fis g a4 fis8 d
    a'16( h) a8 fis d a'4 r8 a'
    g( fis) e a g( fis) e a,
    g( fis) e a g( fis) e a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Andante"
    \partial 8 a'8\f d e fis g a4 fis8 d
    a'16( h) a8 fis d a'4 r8 a,,
    d e fis g a4 fis8 d
    a'16( h) a8 fis d a'4 r8 a'
    g( fis) e a g( fis) e a,
    g( fis) e a g( fis) e a
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \tempoMarkup "Andante"
    \partial 8 a8\f d e fis g a4 fis8 d
    a'16( h) a8 fis d a'4 r8 a,
    d e fis g a4 fis8 d
    a'16( h) a8 fis d a' a, cis fis
    e( d) cis fis e( d) cis d
    a4 a a4. a8
  }
}

Chords = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Andante"
    \partial 8 a'8 d e fis g a4 fis8 d
    a'16( h) a8 fis d a'4 r8 a,,
    d e fis g a4 fis8 d
    a'16( h) a8 fis d a'4 r8 a'
    g( fis) e a g( fis) e a,
    g( fis) e a g fis e a
  }
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Andante"
    \partial 8 a8^\markup \remark "Ottava" d e fis g a4 fis8 d
    a'16( h) a8 fis d a'4 r8 a,
    d e fis g a4 fis8 d
    a'16( h) a8 fis d a' a, a a
    a1~
    a2 a4. a8
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
