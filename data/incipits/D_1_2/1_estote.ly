\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Andante"
    r4 r8 a'16 b c8 a d c16 b
    c8 f, r f'16 es d es d c b c d b \gotoBar "9"
    b8 a16 b g8. f16 f f' c b a4
    r2 r16 f'\p a, b c4
    r8 d4 b'8 r c,4 a'8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Andante"
    R1*2 \gotoBar "9"
    e8 f4 e8 f16 c' a g f4
    r2 r16 a\p f g a4
    r8 d4 b'8 r c,4 a'8
  }
}

Soprano = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    R1*2 \gotoBar "9"
    r2 r4 r8 a'16[^\solo b16]
    c8 b16[ a] d8 c16 b c8 f, f'8. es16
    d[ es d c] b[ c d b] c[ d c b] a[ b c a]
  }
}

SopranoLyrics = \lyricmode {
  E --
  sto -- te for -- tes in bel -- lo, et pu --
  gna -- _ _ "-"
}

Alto = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    R1*2 \gotoBar "9"
    R1*3
  }
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Andante"
    f8 c a f r f' b, b'~
    b a16 g a8 f b b, d b \gotoBar "9"
    c f c' c, f4 r
    f b, f r8 f' %10
    b4 g a f
  }
}

BassFigures = \figuremode {
  r1
  <2>8 r2..
  <7>1
  r
  r
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
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
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
