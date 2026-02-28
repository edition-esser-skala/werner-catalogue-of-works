\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]"
    r4 a' b2 a4 d
    d c b4. b8 a4 d~
    d cis d a b8 c d e
    f4. e8 d4 d c f
    d c c c d c
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]"
    r2 r4 d f2
    e4 a a g f2~
    f8 e16 d e4 d f8 e d e f g
    a2 b4 b a8 g f4
    f e f2 r4 f
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    r4 a' b2 a4 d
    d c b4. b8 a4 d
    d cis d a b8[ c] d[ e]
    f4. e8 d4 d c f
    d c c c d c
  }
}

SopranoLyricsA = \lyricmode {
  Sa -- lu -- tis hu --
  ma -- nae sa -- _ tor, sa --
  _ _ tor, Je -- su vo --
  lu -- _ ptas, vo -- lu -- ptas
  cor -- di -- um, or -- bis "re -"
}

SopranoLyricsB = \lyricmode {
  Qua vi -- ctus es __
  _ cle -- men -- ti -- a, cle --
  men -- ti -- a ut no -- stra
  fer -- _ res, fer -- _ res
  cri -- mi -- na mor -- tem "sub -"
}

SopranoLyricsC = \lyricmode {
  Tu dux ad a --
  stra et se -- mi -- ta, se --
  _ mi -- ta sis me -- ta
  no -- _ stris, no -- _ stris
  cor -- di -- bus sis la -- "cry -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    r2 r4 d f2
    e4 a a g f2~
    f8[ e16 d] e4 d f8[ e] d[ e] f[ g]
    a2 b4 b a8[ g] f4
    f e f2 r4 f
  }
}

AltoLyricsA = \lyricmode {
  Sa -- lu --
  tis hu -- ma -- nae sa --
  _ tor, Je -- su vo --
  lu -- ptas, vo -- lu -- ptas
  cor -- di -- um, "or -"
}

AltoLyricsB = \lyricmode {
  Qua vi --
  ctus es __ _ cle -- men --
  ti -- a ut no -- stra
  fer -- res, ut fer -- res
  cri -- mi -- na "mor -"
}

AltoLyricsC = \lyricmode {
  Tu dux
  ad a -- stra et se --
  mi -- ta sis me -- ta
  no -- stris, sis no -- stris
  cor -- di -- bus sis
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    r2 r r4 f,
    a2 f4 g a4. b8
    a2 a r
    r4 f f8[ e] f[ g] a4 a
    g4. g8 a2 r
  }
}

TenoreLyricsA = \lyricmode {
  Sa --
  lu -- tis hu -- ma -- nae
  sa -- tor,
  Je -- su vo -- lu -- ptas
  cor -- di -- um,
}

TenoreLyricsB = \lyricmode {
  Qua
  vi -- ctus es cle -- _
  men~ti -- a
  ut no -- stra fer -- res
  cri -- mi -- na
}

TenoreLyricsC = \lyricmode {
  Tu
  dux ad a -- stra et
  se~mi -- ta
  sis me -- ta no -- stris
  cor -- di -- bus
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    d2 g d4 d
    a2 d4 e f4. g8
    a2 d, r
    r4 d8[ c] b[ c] d[ e] f4 d
    b c f,2 r
  }
}

BassoLyricsA = \lyricmode {
  Sa -- lu -- tis hu --
  ma -- nae, hu -- ma -- nae
  sa -- tor,
  Je -- su vo -- lu -- ptas
  cor -- di -- um,
}

BassoLyricsB = \lyricmode {
  Qua vi -- ctus, qua
  vi -- ctus es cle -- _
  men~ti -- a
  ut no -- stra fer -- res
  cri -- mi -- na
}

BassoLyricsC = \lyricmode {
  Tu dux ad __ _
  a -- stra, a -- stra et
  se~mi -- ta
  sis me -- ta no -- stris
  cor -- di -- bus
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]"
    d2 g4 g, d'2
    a d4 e f4. g8
    a2 d,4 \clef soprano << { a'' b8 c d e f4 } \\ { f,8 e d e f g a4 } >>
    \clef bass d,,8 c b c d e f4 d
    b c f, \clef soprano << { c''' d c } \\ { r4 r f, } >>
  }
}

BassFigures = \figuremode {
  r1.
  <4>4 <3> <6 5> <5> q <6>
  <6 4> <5 _+> r1
  r4. <6>8 r1
  <6 5>1.
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
    \new ChoirStaff \with { \setGroupDistance #15 #15 } <<
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
