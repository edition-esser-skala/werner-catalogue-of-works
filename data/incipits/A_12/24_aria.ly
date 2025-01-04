\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \dorian \time 3/4 \tempoMarkup "Adagio"
      \once \override Staff.TimeSignature.style = #'single-digit
    \after 4*0 -\conSord R2.*2
    r8 r16 g'' es4 h
    R2.*2
    r8 r16 b' g4 d
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \dorian \time 3/4 \tempoMarkup "Adagio"
      \once \override Staff.TimeSignature.style = #'single-digit
    \after 4*0 -\conSord R2.*2
    r8 r16 es' g,4 f
    R2.*2
    r8 r16 g' b,4 as?
  }
}

Soli = {
  \relative c' {
    \clef tenor
    \key c \dorian \time 3/4 \autoBeamOff \tempoMarkup "Adagio"
      \once \override Staff.TimeSignature.style = #'single-digit
    g4 es' h
    c8.[ b32 a] g4. f8
    es4 r r
    g c8[ d] es4
    b! f as
    g r r
  }
}

SoliLyrics = \lyricmode {
  Umb di -- ße
  ſchö -- _ ne
  Beuth
  iſt mir von
  Her -- _ tzen
  leyd,
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \dorian \time 3/4 \tempoMarkup "Adagio"
      \once \override Staff.TimeSignature.style = #'single-digit
    c2 d4
    es h g
    c2 d4
    es2 c4
    d2.
    es2 f4
  }
}

BassFigures = \figuremode {
  r2 <6!>4
  <6> q2
  r <6!>4
  <6>2.
  <6>2 <5->4
  r2 <6 _->4
}

\score {
  <<
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
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "Leviathan"
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
