\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \dorian \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    \after 4*0 -\conSord R2.
    g'4 g'32( f) es8. d8( f)
    es4 r r
    g, b32( as) g8. f8( \hA as)
    g4 r r
    es8( f) g( as) b4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \dorian \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    \after 4*0 -\conSord R2.
    es4 es'32( d) c8. h8( d)
    c4 r r
    b,!4 g'32( f) es8. d8( f)
    es4 r r
    c8( d) es( f) g4
  }
}

Soli = {
  \relative c' {
    \clef tenor
    \key c \dorian \time 3/4 \autoBeamOff \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    c4 es32([ d) c8.] h8[ d]
    c2 d4
    es8[ d16 c] b!4 as
    \appoggiatura as8 g2 r4
    g8[ as] b4 c8[ d]
    es4. es,8 es4
  }
}

SoliLyrics = \lyricmode {
  Ô waß muß
  dan ô
  groſ -- _ ſer
  Gott
  vor un -- er --
  meß -- ner Greul
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \dorian \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    c2\p d4
    es2 g4
    c, d2
    es b4
    es2 d4
    c c' g
  }
}

BassFigures = \figuremode {
  r2 <6!>4
  <6>2 <_!>4
  r <6> <5->
  r2.
  r
  r2 <6>4
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
        \set Staff.instrumentName = "Adam"
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
