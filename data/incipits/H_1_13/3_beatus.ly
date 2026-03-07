\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/2 \tempoMarkup "[no tempo]"
    r2 r4 e'2 d4~
    d c2 h4 r a'~
    a g fis2. fis4
    h,2 r4 e,8 fis g4 a
    h2. c8 h a2~
    a4 g2 c8 h c4 e,
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key e \minor \time 3/2 \tempoMarkup "[no tempo]"
    r2 h'2. h4
    g e' d g e2~
    e4 h c a fis2
    g4. g8 fis4 e d e8 fis
    e2. a4 d,2~
    d4 e e2 a
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key e \minor \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    R1.*5
    r2 r4 e'^\solo e e
  }
}

SopranoLyrics = \lyricmode {
  Po -- tens in %6
}

Alto = {
  \relative c' {
    \clef alto
    \key e \minor \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
    e2^\solo g fis
    e r4 d c2
    h a4 h8[ c] h4 a
    g2 h4 c d2~
    d4 e c2. d4
    h h h2 a
  }
}

AltoLyrics = \lyricmode {
  Be -- a -- tus
  vir qui ti --
  met Do -- _ _ mi --
  num: In man -- da --
  tis e -- ius
  vo -- let ni \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    R1.*6
  }
}

TenoreLyrics = \lyricmode {
  %tacet
}

Basso = {
  \relative c {
    \clef bass
    R1.*6
  }
}

BassoLyrics = \lyricmode {
  %tacet
}

Organo = {
  \relative c {
    \clef bass
    \key e \minor \time 3/2 \tempoMarkup "[no tempo]"
    e1-\solo h'2
    c g a
    e1 dis2
    e4 e' d! c h a
    gis2 a fis
    g4 e c1
  }
}

BassFigures = \figuremode {
  r1 <4>4 <3>
  <9> <8> <5 4> <\t 3> <9> <8>
  <5 4> <\t 3> <4 2>1
  r1.
  <6 5>2 <9>4 <8> <5> <6>
  <9>2 <7> <6>
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
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

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
