\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key e \minor \time 4/4 \tempoMarkup "[no tempo]"
    e'8 h r16 h' a g fis h, dis h e h fis' h,
    g'8 e c h16 a g8 e' fis, dis'
    e g a16 d, fis a h d, g h a d, c d
    h d g d a d a' d, h8 g' a, fis'
    g, d' g a16 h a g fis e d8 a'
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key e \minor \time 4/4 \tempoMarkup "[no tempo]"
    e'8 h r16 h' a g fis h, dis h e h fis' h,
    g'8 e c h16 a g8 e' fis, dis'
    e g a16 d, fis a h d, g h a d, c d
    h d g d a d a' d, h8 g' a, fis'
    g, d' g a16 h a g fis e d8 a'
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key e \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    e2 h'4 h
    g fis e dis
    e fis g a
    h d! h a
    g g a h
  }
}

SopranoLyrics = \lyricmode {
  O sa -- lu --
  ta -- ris ho -- sti --
  a, quae coe -- li
  pan -- dis o -- sti --
  um: bel -- la "pre -"
}

Alto = {
  \relative c' {
    \clef alto
    \key e \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    e2 h'4 h
    g fis e dis
    e fis g a
    h d! h a
    g g a h
  }
}

AltoLyrics = \lyricmode {
  O sa -- lu --
  ta -- ris ho -- sti --
  a, quae coe -- li
  pan -- dis o -- sti --
  um: bel -- la "pre -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key e \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*5
  }
}

TenoreLyrics = \lyricmode {
  %tacet
}

Basso = {
  \relative c {
    \clef bass
    \key e \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*5
  }
}

BassoLyrics = \lyricmode {
  %tacet
}

Organo = {
  \relative c {
    \clef bass
    \key e \minor \time 4/4 \tempoMarkup "[no tempo]"
    e8 fis g fis16 e dis8 h cis \hA dis
    e g a h c h16 a h8 a
    g fis16 e d!8 c h a16 g fis8 d
    g g' fis d g h, c d
    << { g[ a] } \\ { g,4 } >> h'8 a16 g fis8 d g fis
  }
}

BassFigures = \figuremode {
  r1
  r4 <6>2 <_+>4
  <6> <5> <6>2
  r2. <6 5>4
  r1
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
