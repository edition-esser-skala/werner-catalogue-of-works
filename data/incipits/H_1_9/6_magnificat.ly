\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Andante"
    R1*3
    r2 r8 a'\p d fis
    e8.\trill fis32 g a8 e16 cis a8 fis16 a d8 fis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \major \time 4/4 \tempoMarkup "Andante"
    R1*3
    r2 r8 fis\p a fis
    e a cis e fis,4 r8 a16 fis
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    a'2^\solo h4 a
    d4. d8 d2
    d4 d8 d h4 d
    e4. e8 d4 r
    R1
  }
}

SopranoLyrics = \lyricmode {
  Ma -- _ _
  gni -- fi -- cat
  a -- ni -- ma me -- a
  Do -- mi -- num.
}

Alto = {
  \relative c' {
    \clef alto
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*5
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*5
  }
}

Basso = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*3
    r2 r8 d^\solo fis d
    a' e cis h16 a fis'8 d r d
  }
}

BassoLyrics = \lyricmode {
  Et ex -- ul --
  ta -- vit spi -- ri -- tus me -- us in
}

Organo = {
  \relative c {
    \clef bass
    \key d \major \time 4/4 \tempoMarkup "Andante"
    d8-\solo e fis d g, g' fis d
    h h' a g fis e d cis
    h h' fis e16 d g8 e fis h
    g fis16 e a8 g fis4 d
    cis a8 cis d d' fis, d
  }
}

BassFigures = \figuremode {
  r1
  r
  r2. <6>4
  <6 5>1
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

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
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
