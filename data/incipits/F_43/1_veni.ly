\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "[no tempo]"
    g'4 a8 c h a g c~
    c h c4 r r8 e,
    f16 g a h c8 d e16 d c8 h a
    g4 fis8 g4 fis8 g4
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "[no tempo]"
    r4 c d8 f e a
    d, g e e f16 g a h c8. h16
    a g f8 e8 g e16 fis g a d,8 fis
    h,16 c d e a,8 d4 d8 d g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    g'4 a8 c h a g[ c]~
    c h c4 r r8 e,
    f16[ g] a[ h] c8 d e16[ d] c8 h a
    g4 fis8 g4 fis8 g4
  }
}

SopranoLyricsA = \lyricmode {
  Ve -- ni, cre -- a -- tor Spi --
  ri -- tus, men --
  tes tu -- o -- rum vi -- si -- ta, tu --
  o -- rum vi -- si -- ta:
}

SopranoLyricsB = \lyricmode {
  Ac -- cen -- de lu -- men sen --
  si -- bus, in --
  fun -- de~a -- mo -- rem cor -- di -- bus, a --
  mo -- rem cor -- di -- bus,
}

SopranoLyricsC = \lyricmode {
  De -- o Pa -- tri sit glo --
  ri -- a et
  Fi -- lio, qui a mor -- tu -- is, qui
  a mor -- _ tu -- is
}

Alto = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    r4 c d8 f e a
    d, g e e f16[ g] a[ h] c8. h16
    a[ g] f8 e8 g e16[ fis g a] d,8 fis
    h,16[ c] d[ e] a,8 d4 d8 d g
  }
}

AltoLyricsA = \lyricmode {
  Ve -- ni, cre -- a -- tor
  Spi -- ri -- tus, men -- tes tu -- o -- _
  _ _ rum, tu -- o -- rum, tu --
  o -- _ rum vi -- si -- ta: "im -"
}

AltoLyricsB = \lyricmode {
  Ac -- cen -- de lu -- men
  sen -- si -- bus, in -- fun -- de~a -- mo -- _
  _ _ rem, a -- mo -- rem, a --
  mo -- _ rem cor -- di -- bus, "in -"
}

AltoLyricsC = \lyricmode {
  De -- o Pa -- tri sit
  glo -- ri -- a et Fi -- lio, qui a
  mor -- tu -- is, et Fi -- lio a
  mor -- tu -- is, mor -- tu -- is "sur -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1
    g4 a8 c h a g[ c]
    d8. d16 g,4 r r8 fis
    g16[ a] h[ cis] d8 h a8. a16 h4
  }
}

TenoreLyricsA = \lyricmode {
  Ve -- ni, cre -- a -- tor Spi --
  _ ri -- tus, men --
  tes tu -- o -- rum vi -- si -- ta:
}

TenoreLyricsB = \lyricmode {
  Ac -- cen -- de lu -- men sen --
  _ si -- bus, in --
  fun -- de~a -- mo -- rem cor -- di -- bus,
}

TenoreLyricsC = \lyricmode {
  De -- o Pa -- tri sit glo --
  _ ri -- a et
  Fi -- lio, qui a mor -- tu -- is
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1
    r4 c d8 f e a
    d,8. d16 c8 h c16[ d] e[ fis] g8 d
    e8. e16 d4 d8. d16 g,4
  }
}

BassoLyricsA = \lyricmode {
  Ve -- ni, cre -- a -- tor
  Spi -- ri -- tus, men -- tes tu -- o -- rum
  vi -- si -- ta, vi -- si -- ta:
}

BassoLyricsB = \lyricmode {
  Ac -- cen -- de lu -- men
  sen -- si -- bus, in -- fun -- de~a -- mo -- rem
  cor -- di -- bus, cor -- di -- bus,
}

BassoLyricsC = \lyricmode {
  De -- o Pa -- tri sit
  glo -- ri -- a et Fi -- lio, qui a
  mor -- tu -- is, mor -- tu -- is
}

Organo = {
  \relative c {
    \clef soprano
    \key c \major \time 4/4 \tempoMarkup "[no tempo]"
    << { g''4_! a8 c h a g c } \\ { s4 c, d8 f e a } >>
    \clef tenor g,4 \clef bass c, d8 f e a
    d,4 c8 h c16 d e fis g8 d
    e4 d2 g,8 \noBeam \clef soprano g''-!
  }
}

BassFigures = \figuremode {
  r1
  <4>8 <3> <6> <5> <6> <3> <6>4
  <5>8 <6>4 r2 <_+>8
  <5> <6\\> <5 _+> <6 4> <5 \t> <\t _+>4.
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
