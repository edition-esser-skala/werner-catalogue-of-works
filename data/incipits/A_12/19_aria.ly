\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Allegretto"
    g'8\f h~ h cis16 d a8 cis, d e16 fis
    g8 g' g g g fis16 e fis8 d \gotoBar "16"
    R1
    r8 h16\p cis d8 e a, cis, d4
    r8 e' fis g d fis, g a16 h
    e,8. fis16 g8 a d, g, r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Allegretto"
    g'8\f h~ h cis16 d a8 cis, d e16 fis
    g8 g' g g g fis16 e fis8 d \gotoBar "16"
    R1
    r8 h16\p cis d8 e a, cis, d4
    r8 e' fis g d fis, g a16 h
    e,8. fis16 g8 a d, g, r4
  }
}

Viola = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \tempoMarkup "Allegretto"
    h4\f g d'8. e16 fis8 d
    h8. cis16 d8 e a,2 \gotoBar "16"
    R1*4
  }
}

Soli = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Allegretto"
    R1*2 \gotoBar "16"
    g'4. h8 a[ cis,] d[ e16 fis]
    g4. g8 g4 fis
    e4. fis8 g16[ fis] g4 a16[ h]
    c4. c8 h4 d
  }
}

SoliLyrics = \lyricmode {
  Ich, der Schö -- pffer
  al -- ler Din -- gen,
  khenn daß Hertz _ nur
  all -- zu wohl, wie
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Allegretto"
    g4\f g' fis2
    e8 d16 cis h8 \hA cis d4 d, \gotoBar "16"
    g4 g' fis2
    e8 d16 cis h8 \hA cis d4 d,
    c' c' h2
    a8 g16 fis e8 fis g g, g a
  }
}

BassFigures = \figuremode {
  r1
  r4 <6> <4> <_+>
  r1
  r4 <6> <4> <_+>
  r1
  r4 <6>2.
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
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "Schöpffer"
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
}
