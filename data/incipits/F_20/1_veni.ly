\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    r2 c' h d
    c g a2. a4
    g1 a
    a2 h c a
    g c d a4 h
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key c \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve
    r1 r2 f
    e g f c
    d2. d4 c2 f~
    f e d1
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
     r2 c' h d
    c g a2. a4
    g1 a
    a2 h c a
    g c d a4 h
  }
}

SopranoLyricsA = \lyricmode {
  Ve -- ni, cre --
  a -- tor Spi -- ri --
  tus, cre --
  a -- tor Spi -- ri --
  tus, cre -- "a -"
}

SopranoLyricsB = \lyricmode {
  Ac -- cen -- de
  lu -- men sen -- si --
  bus, lu --
  _ men sen -- si --
  bus, ac -- cen -- de __ _
}

SopranoLyricsC = \lyricmode {
  De -- o Pa --
  tri sit glo -- ri --
  a, Pa --
  tri sit glo -- ri --
  a, De -- o "Pa -"
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve
    r1 r2 f
    e g f c
    d2. d4 c2 f~
    f e d1
  }
}

AltoLyricsA = \lyricmode {
  Ve --
  ni, cre -- a -- tor
  Spi -- ri -- tus, Spi --
  ri -- tus,
}

AltoLyricsB = \lyricmode {
  Ac --
  cen -- de lu -- men
  sen -- si -- bus, sen --
  si -- bus,
}

AltoLyricsC = \lyricmode {
  De --
  o Pa -- tri sit
  glo -- ri -- a, glo --
  ri -- a,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    r1 r2 a
    g c c a
    c1 r
    R\breve
    c1 h2 d
  }
}

TenoreLyricsA = \lyricmode {
  Ve --
  ni, cre -- a -- _
  tor,

  ve -- ni, "cre -"
}

TenoreLyricsB = \lyricmode {
  Ac --
  cen -- de lu -- _
  men,

  ac -- cen -- de
}

TenoreLyricsC = \lyricmode {
  De --
  o sit glo -- ri --
  a,

  De -- o "Pa -"
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    c1 d
    e f
    c r
    R\breve*2
  }
}

BassoLyricsA = \lyricmode {
  Ve -- ni,
  cre -- a --
  tor,
}

BassoLyricsB = \lyricmode {
  Ac -- cen --
  de lu --
  men,
}

BassoLyricsC = \lyricmode {
  De -- o
  Pa -- tri
  sit,
}

Organo = {
  \relative c {
    \clef bass
    \key c \major \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    c1 d
    e f
    c \clef treble << {
      a''
      a2 h c a
    } \\ {
      f2 c
      d1 c2 f
    } >>
    \clef tenor c1 h2 d
  }
}

BassFigures = \figuremode {
  r1 <6>2 <5>
  <6>\breve
  r
  r
  <4>2 <3>1 <5>4 <6>
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
