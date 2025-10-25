\version "2.24.2"
\include "header.ly"

\layout {
  \context {
    \Lyrics
    \override StanzaNumber.font-series = #'medium
    \override StanzaNumber.font-size = #-1
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*2
    r4 d'4.\f e16 f
    c4 f,4. g16 a \gotoBar "10"
    f'4 r r
    R2.*2
    r8 c\p \tuplet 3/2 4 { a'8 g f } e( d)
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    r4 a'4.\f b16 c
    g4 c,4. d16 e
    f8( e) f4. g8
    e( g) c( a) a( f) \gotoBar "10"
    f4 r r
    R2.*2
    r8 a\p \tuplet 3/2 4 { c b a } b( d)
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 3/4 \tempoMarkup "Largo" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*4 \gotoBar "10"
    r4 a'4.^\solo \tuplet 3/2 8 { c16[ b a] }
    g8[ c,] c'4.~ \tuplet 3/2 8 { c16[ d e] }
    \tuplet 3/2 4 { f8[ e d] } \appoggiatura c4 b2
    b8[ a] a4 r
  }
}

SopranoLyricsA = \lyricmode {
  \set stanza = "1. "
  Wer Ma --
  ri -- am __
  recht will
  lie -- ben
}

SopranoLyricsB = \lyricmode {
  \set stanza = "2. "
  Wer auch
  will vor __
  an -- dern
  al -- len
}

SopranoLyricsC = \lyricmode {
  \set stanza = "3. "
  Sanfft -- mueth,
  Lie -- be __
  und Ver --
  trau -- en
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 3/4 \tempoMarkup "Largo"
      \once \override Staff.TimeSignature.style = #'single-digit
    f4 f, f'~
    f e a
    d, b b'~
    b a d \gotoBar "10"
    f,,2 f'4~
    f e a
    d, g e
    f f, g
  }
}

BassFigures = \figuremode {
  r2.
  <5 2>2.
  r2 <5>8 <6>
  <4 2>2.
  r
  <5 2>2.
  r2 <5>4
  <4> <3> <6>8 <5>
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
    \new ChoirStaff \with { \setGroupDistance #17 #17 } <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyricsA
      \new Lyrics \lyricsto Soprano \SopranoLyricsB
      \new Lyrics \lyricsto Soprano \SopranoLyricsC
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
