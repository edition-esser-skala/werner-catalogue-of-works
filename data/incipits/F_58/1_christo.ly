\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key b \major \time 3/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 3/2
    r2 f a4 f
    b8 c d es f4 d c c
    f,2 r r4 c'
    d e f f8 es? d4 c
    b8 a g4 a h c2
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key b \major \time 3/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 3/2
    b2 d4 b f'4. es8
    d c b2 b'4 a2
    r r4 f g a
    b g a8 g a4 b a8 g
    f4 e8 d c4 d \hA e f
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 3/2
    r2 f a4 f
    b8[ c d es] f4 d c c
    f,2 r r4 c'
    d e f f8[ es?] d4 c
    b8[ a] g4 a h c2
  }
}

SopranoLyricsA = \lyricmode {
  Chri -- sto pro --
  fu -- _ sum san -- gui --
  ne et
  mar -- ty -- rum vi -- cto -- ri --
  as, vi -- cto -- ri -- as
}

SopranoLyricsB = \lyricmode {
  Ter -- ro -- re
  vi -- _ cto sae -- cu --
  li poe --
  nis -- que spre -- tis cor -- po --
  ris, __ _ cor -- po -- ris
}

SopranoLyricsC = \lyricmode {
  Te nunc Re --
  dem -- _ ptor quae -- su --
  mus ut
  mar -- ty -- rum con -- sor -- ti --
  o, con -- sor -- ti -- o
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 3/2
    b2 d4 b f'4. es8
    d[ c] b2 b'4 a2
    r r4 f g a
    b g a8[ g] a4 b a8[ g]
    f4 e8[ d] c4 d \hA e f~
  }
}

AltoLyricsA = \lyricmode {
  Chri -- sto pro -- fu -- _
  sum san -- gui -- ne
  et mar -- ty --
  rum vi -- cto -- ri -- as, et
  mar -- ty -- rum vi -- cto \hy
}

AltoLyricsB = \lyricmode {
  Ter -- ro -- re vi -- _
  cto sae -- cu -- li
  poe -- nis -- que
  spre -- tis cor -- po -- ris, poe --
  nis -- que spre -- tis cor \hy
}

AltoLyricsC = \lyricmode {
  Te nunc Re -- dem -- _
  ptor quae -- su -- mus
  ut mar -- ty --
  rum con -- sor -- ti -- o, ut
  mar -- ty -- rum con -- sor \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 3/2
    R1.
    r2 f, a4 f
    b8[ a b d] c4 b es4. es8
    d4 r r f, g a
    b c8[ b] a4 g8[ f] g4 a
  }
}

TenoreLyricsA = \lyricmode {
  Chri -- sto pro --
  fu -- _ sum san -- gui --
  ne et mar -- ty --
  rum vi -- cto -- ri -- as, "vi -"
}

TenoreLyricsB = \lyricmode {
  Ter -- ro -- re
  vi -- _ cto sae -- cu --
  li poe -- nis -- que
  spre -- tis cor -- po -- ris, "cor -"
}

TenoreLyricsC = \lyricmode {
  Te nunc Re --
  dem -- _ ptor quae -- su --
  mus ut mar -- ty --
  rum con -- sor -- ti -- o, "con -"
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 3/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 3/2
    R1.
    b2 d4 b f'4. es8
    d4 g8[ f] es4 d c f
    b, r r2 r4 c
    d e f \hA e8[ d] c4 f
  }
}

BassoLyricsA = \lyricmode {
  Chri -- sto pro -- fu -- _
  sum, pro -- fu -- sum san -- gui --
  ne et
  mar -- ty -- rum vi -- cto \hy
}

BassoLyricsB = \lyricmode {
  Ter -- ro -- re vi -- _
  cto, vi -- _ cto sae -- cu --
  li poe --
  nis -- que spre -- tis, spre -- tis
}

BassoLyricsC = \lyricmode {
  Te nunc Re -- dem -- _
  ptor, Re -- dem -- ptor quae -- su --
  mus ut
  mar -- ty -- rum con -- sor \hy
}

Organo = {
  \relative c {
    \clef soprano
    \key b \major \time 3/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 3/2
    << { s2 f' a4 f } \\ { b,2^! d4 b f'4. es8 } >>
    \clef bass b,2 d4 b f'4. es8
    d4 g8 f es4 d c f
    b, \clef soprano << { e'' f } \\ { g, a } >> \clef tenor f, g \clef bass c,
    d e f \hA e8 d c4 f
  }
}

BassFigures = \figuremode {
  r1.
  r
  <6>2 q4 q <7> q
  r1 r4 <6>
  q q2 <5!>2.
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
