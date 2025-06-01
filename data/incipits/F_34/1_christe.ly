\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key f \lydian \time 3/2 \tempoMarkup "[no tempo]"
    c'2 a4 d h2
    g4 c2 a4 g2
    R1.
    r4 f c'2 a4 d
    g, c2 h4 c2
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key f \lydian \time 3/2 \tempoMarkup "[no tempo]"
    r2 f d4 g
    e2 c4 f2 e4
    f f2 d4 g e~
    e c r c f2
    e4 a d, g e4. e8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \lydian \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    \phrasingSlurDashed c'2 a4 d h2
    g4 c2 a4 g2
    R1.
    r4 f c'2 a4 d
    g, c\( c\) h c2
  }
}

SopranoLyricsA = \lyricmode {
  Chri -- ste re -- dem --
  ptor o -- mni -- um

  quem lu -- cis an --
  te o -- ri -- gi -- nem,
}

SopranoLyricsB = \lyricmode {
  Me -- men -- to re --
  rum con -- di -- tor

  no -- stri quod o --
  lim cor -- _ po -- ris
}

SopranoLyricsC = \lyricmode {
  Je -- su ti -- bi
  sit glo -- ri -- a

  qui na -- tus es
  de vir -- _ gi -- ne,
}

Alto = {
  \relative c' {
    \clef alto
    \key f \lydian \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    r2 f d4 g
    e2 c4 f2 e4
    f f2 d4 g e~
    e c r c f2
    e4 a d, g e4. e8
  }
}

AltoLyricsA = \lyricmode {
  Chri -- ste re --
  dem -- ptor o -- mni --
  um, Chri -- ste re -- dem --
  ptor, quem lu --
  cis an -- te o -- ri -- "gi -"
}

AltoLyricsB = \lyricmode {
  Me -- men -- to
  re -- rum con -- di --
  tor, me -- men -- to re --
  rum, no -- stri
  quod o -- lim cor -- _ "po -"
}

AltoLyricsC = \lyricmode {
  Je -- su ti --
  bi sit glo -- ri --
  a, Je -- su ti -- bi __
  sit, qui na --
  tus __ _ es de vir -- "gi -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \lydian \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1.
    r2 r c
    a4 d h2 g4 c~
    c a g4. g8 f2
    r r4 g c2
  }
}

TenoreLyricsA = \lyricmode {
  Chri --
  ste re -- dem -- ptor o --
  _ _ mni -- um
  quem "lu -"
}

TenoreLyricsB = \lyricmode {
  Me --
  men -- to re -- rum con --
  _ _ di -- tor
  no -- stri
}

TenoreLyricsC = \lyricmode {
  Je --
  su ti -- bi sit glo --
  _ _ ri -- a
  qui "na -"
}

Basso = {
  \relative c {
    \clef bass
    \key f \lydian \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    R1.*2
    f2 d4 g e2
    c4 f2 e4 d4. d8
    c2 r r4 c
  }
}

BassoLyricsA = \lyricmode {
  Chri -- ste re -- dem --
  ptor o -- _ _ mni --
  um quem
}

BassoLyricsB = \lyricmode {
  Me -- men -- to re --
  rum con -- _ _ di --
  tor "no -"
}

BassoLyricsC = \lyricmode {
  Je -- su ti -- bi
  sit glo -- _ _ ri --
  a qui
}

Organo = {
  \relative c {
    \clef soprano
    \key f \lydian \time 3/2 \tempoMarkup "[no tempo]"
    << {
      c''2 a4 d h2
      g4 c a2
    } \\ {
      r2 f d4 g
      e2 c4 f
    } >> \clef tenor c2
    \clef bass f, d4 g e2
    c4 f2 e4 d2
    c4 \clef soprano << { c''2 } \\ { a4 d, } >> \clef tenor g, c \clef bass c,
  }
}

BassFigures = \figuremode {
  r1.
  r1 <5 4>4 <\t 3>
  <5> <6> <6!>2 <5>4 <6>
  r <5 3> <2> r <5> <6!>
  r2. <3>
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
