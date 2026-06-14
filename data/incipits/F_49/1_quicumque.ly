\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key d \dorian \time 4/4 \tempoMarkup "[no tempo]"
    R1*2
    r2 r8 a' a gis
    a c h8. h16 a4 r
    r8 g a a h c c h
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key d \dorian \time 4/4 \tempoMarkup "[no tempo]"
    r8 d d cis d f e8. e16
    d8 f8. f16 e d c d e f g d g8~
    g16 a f d e4. d8 e16 h e8~
    e16 g f e d8 e e d e e
    fis g g \hA fis g c, d d
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \dorian \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1*2
    r2 r8 a' a gis
    a c h8. h16 a4 r
    r8 g a a h c c h
  }
}

SopranoLyricsA = \lyricmode {
  Qui -- cum -- que
  Chri -- stum quae -- ri -- tis
  il -- lic li -- ce -- bit vi -- "se -"
}

SopranoLyricsB = \lyricmode {
  Hic il -- le
  Rex est gen -- ti -- um
  pro -- mis -- sus A -- bra -- hae "Pa -"
}

SopranoLyricsC = \lyricmode {
  Glo -- ri -- a
  ti -- bi Do -- mi -- ne
  cum Pa -- tre~et San -- cto Spi -- "ri -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \dorian \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
      \phrasingSlurDashed
    r8 d d cis d f e8. e16
    d8 f8. f16 e d c[ d] e[ f] g[ d g8]~
    g16[ a f d] e4. d8 e16[ h e8]~
    e16[ g f e] d8 e e d e e
    fis g g \hA fis g c, d d
  }
}

AltoLyricsA = \lyricmode {
  Qui -- cum -- que Chri -- stum quae -- ri --
  tis o -- cu -- los in al -- tum tol --
  _ _ _
  _ li -- te il -- lic li --
  ce -- bit vi -- se -- re, il -- lic "li -"
}

AltoLyricsB = \lyricmode {
  Hic il -- le Rex est gen -- ti --
  um po -- pu -- li -- que Rex Ju -- da --
  _ _ _
  _ i -- ci pro -- mis -- sus
  A -- bra -- hae Pa -- tri, pro -- mis -- sus
}

AltoLyricsC = \lyricmode {
  Glo -- ri -- a ti -- bi Do -- mi --
  ne qui ap -- pa -- ru -- i -- sti ho --
  _ _ _
  _ di -- e cum Pa -- tre~et
  San -- cto Spi -- ri -- tu, cum Pa -- tre~et
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \dorian \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1
    r8 a a gis a c h8. h16
    a8 b16 a g8 a f16[ g] a8 h8. h16
    e,8 a h h cis d d \hA cis
    d4 c16[ es] d[ c] h![ a] g8 f g
  }
}

TenoreLyricsA = \lyricmode {
  Qui -- cum -- que Chri -- stum quae -- ri --
  tis o -- cu -- los in al -- tum tol -- li --
  te il -- lic li -- ce -- bit vi -- se --
  re, vi -- se -- re, li -- ce -- bit,
}

TenoreLyricsB = \lyricmode {
  Hic il -- le Rex est gen -- ti --
  um po -- pu -- li -- que Rex Ju -- da -- i --
  ci pro -- mis -- sus A -- bra -- hae Pa --
  tri, A -- bra -- hae Pa -- _ tri,
}

TenoreLyricsC = \lyricmode {
  Glo -- ri -- a ti -- bi Do -- mi --
  ne qui ap -- pa -- ru -- i -- sti ho -- di --
  e cum Pa -- tre~et San -- cto Spi -- ri --
  tu, et San -- cto Spi -- ri -- tu,
}

Basso = {
  \relative c {
    \clef bass
    \key d \dorian \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    R1*2
    r8 d d cis d f e8. d16
    c[ h] a4 gis8 a f' e a
    d, b' a8. a16 g[ f] e8 d g
  }
}

BassoLyricsA = \lyricmode {
  Qui -- cum -- que Chri -- stum quae -- ri --
  tis, quae -- ri -- tis, in al -- tum,
  al -- tum tol -- li -- te il -- lic "li -"
}

BassoLyricsB = \lyricmode {
  Hic il -- le Rex est gen -- ti --
  um, gen -- ti -- um Rex po -- pu --
  li Ju -- da -- i -- ci pro -- mis -- sus
}

BassoLyricsC = \lyricmode {
  Glo -- ri -- a ti -- bi Do -- mi --
  ne, Do -- mi -- ne qui~ap -- pa -- ru --
  i -- sti ho -- di -- e cum Pa -- tre~et
}

Organo = {
  \relative c {
    \clef alto
    \key d \dorian \time 4/4 \tempoMarkup "[no tempo]"
    r8 d' d cis d f e8.\trill e16
    << {
      d8 f4 e16 d c d e f g d g8~
      g
    } \\ {
      r8 a, a gis a c h8. h16
      a8
    } >> \clef bass d, d cis d f e8. d16
    c h a4 gis8 a f' e a
    d, b' a8. g16 g f e8 d g
  }
}

BassFigures = \figuremode {
  r1
  r
  r8 <3 6-> <2 4> <6> <9> <6> <4> <_+>
  <6>16 <6> <6> <5> <4 2>8 <6> r <6> <7> <_+>
  q <6> <7> <6\\> <_!> <6> <7> <_!>
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
