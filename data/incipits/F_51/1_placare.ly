\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    a'1 f'2. e4
    d2 f e2. d4
    cis2 d1 \hA cis2
    d1 r
    R\breve
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    r1 d
    b'2. a4 g2 b
    a4 g f2 e2. e4
    d1 r
    r r2 a'
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    a'1 f'2. e4
    d2 f e2. d4
    cis2 d1 \hA cis2
    d1 r
    R\breve
  }
}

SopranoLyricsA = \lyricmode {
  Pla -- ca -- re
  Chri -- ste ser -- vu --
  lis, ser -- vu --
  lis
}

SopranoLyricsB = \lyricmode {
  Vos pur -- pu --
  ra -- ti Mar -- ty --
  res, Mar -- ty --
  res
}

SopranoLyricsC = \lyricmode {
  De -- o Pa --
  tri sit glo -- ri --
  a, glo -- ri --
  a
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    r1 d
    b'2. a4 g2 b
    a4 g f2 e2. e4
    d1 r
    r r2 a'
  }
}

AltoLyricsA = \lyricmode {
  Pla --
  ca -- re Chri -- ste,
  Chri -- _ ste ser -- vu --
  lis

  "qui -"
}

AltoLyricsB = \lyricmode {
  Vos
  pur -- pu -- ra -- ti
  Mar -- _ _ _ ty --
  res

  vos
}

AltoLyricsC = \lyricmode {
  De --
  o Pa -- tri sit
  glo -- _ _ _ ri --
  a
  "na -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    r1 a
    f'2. e4 d2 f
    e2. d4 cis2 d
  }
}

TenoreLyricsA = \lyricmode {
  Pla --
  ca -- re Chri -- ste
  ser -- vu -- lis, "ser -"
}

TenoreLyricsB = \lyricmode {
  Vos
  pur -- pu -- ra -- ti
  Mar -- ty -- res, "Mar -"
}

TenoreLyricsC = \lyricmode {
  De --
  o Pa -- tri sit
  glo -- ri -- a, "glo -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/2 \autoBeamOff \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    R\breve*3
    d1 b'2. a4
    g2 b a4 g f2
  }
}

BassoLyricsA = \lyricmode {
  Pla -- ca -- re
  Chri -- ste, Chri -- _ ste
}

BassoLyricsB = \lyricmode {
  Vos pur -- pu --
  ra -- ti Mar _ \hy
}

BassoLyricsC = \lyricmode {
  De -- o Pa --
  tri, Pa -- tri __ _ sit
}

Organo = {
  \relative c {
    \clef soprano
    \key d \minor \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    a''1-! << {
      f'2. e4
      d2 f e2. d4
      cis2 d
    } \\ {
      d,1
      b'2. a4 g2 b
      a4 g f2
    } >> \clef tenor a,1
    \clef bass d, b'2. a4
    g2 b a4 g f2
  }
}

BassFigures = \figuremode {
  r\breve
  r
  r1 <4>2 <_+>
  r1 <3>2 <5>4 <\t>
  <6>2 <4>4 <3> <_+>2 <6>
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
