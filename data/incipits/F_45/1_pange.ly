\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key e \phrygian \time 3/2 \tempoMarkup "[no tempo]"
    R1.*2
    a'2 c h
    a4 d2 c4 d2
    e4 c d2 c4 c
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key e \phrygian \time 3/2 \tempoMarkup "[no tempo]"
    e2 f e
    d4 g2 f4 g2
    a4 f g g f d
    e f g e a g
    g2 r4 g a2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key e \phrygian \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1.*2
    a'2 c h
    a4 d2 c4 d2
    e4 c d4. d8 c4 c~
  }
}

SopranoLyricsA = \lyricmode {
  Pan -- ge, lin --
  gua, glo -- ri -- o --
  si cor -- _ po -- ris "my -"
}

SopranoLyricsB = \lyricmode {
  Tan -- tum er --
  go sa -- cra -- men --
  tum ve -- _ ne -- re \hy
}

SopranoLyricsC = \lyricmode {
  Ge -- ni -- to --
  ri ge -- ni -- to --
  que laus _ et iu \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key e \phrygian \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    e2 f e
    d4 g2 f4 g2
    a4 f g g f d
    e f g e a g
    g2 r4 g a4. a8
  }
}

AltoLyricsA = \lyricmode {
  Pan -- ge, lin --
  gua, glo -- ri -- o --
  si, glo -- _ ri -- o -- _
  si, glo -- _ ri -- o -- _
  si cor -- _ "po -"
}

AltoLyricsB = \lyricmode {
  Tan -- tum er --
  go sa -- cra -- men --
  tum, sa -- _ cra -- men -- _
  tum, sa -- _ cra -- men -- _
  tum ve -- _ \hy
}

AltoLyricsC = \lyricmode {
  Ge -- ni -- to --
  ri ge -- ni -- to --
  que, ge -- _ ni -- to -- _
  que, ge -- _ ni -- to -- _
  que laus __ _ _
}

Tenore = {
  \relative c' {
    \clef tenor
    \key e \phrygian \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    r2 a c
    h a4 d2 c4~
    c d c2 d
    c4 a h c2 h4
    c2 r r
  }
}

TenoreLyricsA = \lyricmode {
  Pan -- ge,
  lin -- gua, glo -- ri --
  o -- si glo --
  ri -- _ o -- _ _
  si
}

TenoreLyricsB = \lyricmode {
  Tan -- tum
  er -- go sa -- cra --
  men -- tum, sa --
  cra -- _ men -- _ _
  tum
}

TenoreLyricsC = \lyricmode {
  Ge -- ni --
  to -- ri ge -- ni --
  to -- que, ge --
  ni -- _ to -- _ _
  que
}

Basso = {
  \relative c {
    \clef bass
    \key e \phrygian \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1.
    r2 r e
    f e d4 g~
    g f e a f g
    c,2 r r
  }
}

BassoLyricsA = \lyricmode {
  Pan --
  ge, lin -- gua, glo --
  ri -- o -- _ _ _
  si
}

BassoLyricsB = \lyricmode {
  Tan --
  tum er -- go sa --
  cra -- men -- _ _ _
  tum
}

BassoLyricsC = \lyricmode {
  Ge --
  ni -- to -- ri ge --
  ni -- to -- _ _ _
  que
}

Organo = {
  \relative c {
    \clef tenor
    \key e \phrygian \time 3/2 \tempoMarkup "[no tempo]"
    << {
      e'2 f e
      d4 g2 f4
    } \\ {
      r2 a, c
      h a4 d
    } >> \clef bass e,2
    f e d4 g~
    g f e a f g
    c, \clef soprano << { c'' d2 c4 c } \\ { r4 r g a2 } >>
  }
}

BassFigures = \figuremode {
  r1.
  r1 <7>4 <6>
  <3 5> <_ 6> <6>2 q
  <4 2>4 <6> <7>2 <6 5>
  r1.
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
    \new ChoirStaff \with { \setGroupDistance #16 #16 } <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyricsA
      \new Lyrics \lyricsto Soprano \SopranoLyricsB
      \new Lyrics \lyricsto Soprano \SopranoLyricsC

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyricsA
      \new Lyrics \lyricsto Alto \AltoLyricsB
      \new Lyrics \lyricsto Alto \AltoLyricsC

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyricsA
      \new Lyrics \lyricsto Tenore \TenoreLyricsB
      \new Lyrics \lyricsto Tenore \TenoreLyricsC

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyricsA
      \new Lyrics \lyricsto Basso \BassoLyricsB
      \new Lyrics \lyricsto Basso \BassoLyricsC
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
