\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]"
    a'2 b a4 d
    d c b2 a
    r r4 a b8 c d e
    f4 f, b4. b8 a2
    g4. g8 a4 c d c
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]"
    r2 d f
    e4 a f g c, f~
    f e d f8 e d e f g
    a4 f d8 e f g c,4 f~
    f e f2 r4 f
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    a'2 b a4 d
    d c b2 a
    r r4 a b8[ c] d[ e]
    f4 f, b4. b8 a2
    g4. g8 a4 c d c
  }
}

SopranoLyricsA = \lyricmode {
  Sa -- lu -- tis hu --
  ma -- nae sa -- tor,
  Je -- su, vo --
  lu -- ptas cor -- di -- um,
  cor -- di -- um, or -- bis "re -"
}

SopranoLyricsB = \lyricmode {
  Per -- rum -- pis in --
  fer -- num cha -- os,
  vin -- ctis ca --
  te -- nas de -- tra -- his,
  de -- tra -- his, vi -- ctor "tri -"
}

SopranoLyricsC = \lyricmode {
  Je -- su ti -- bi
  sit glo -- ri -- a,
  qui vi -- ctor
  in coe -- lum re -- dis,
  re -- dis cum Pa -- tre et
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    r2 d f
    e4 a f g c, f
    f e d f8[ e] d[ e] f[ g]
    a4 f d8[ e] f[ g] c,4 f~
    f e f2 r4 f
  }
}

AltoLyricsA = \lyricmode {
  Sa -- lu --
  tis hu -- ma -- nae sa -- _
  _ _ tor, Je -- su, vo --
  lu -- ptas cor -- di -- um, cor --
  di -- um, "or -"
}

AltoLyricsB = \lyricmode {
  Per -- rum --
  pis in -- fer -- num cha -- _
  _ _ os, vin -- ctis ca --
  te -- nas de -- tra -- his, de --
  tra -- his, "vi -"
}

AltoLyricsC = \lyricmode {
  Je -- su
  ti -- _ bi sit glo -- _
  _ ri -- a, qui vi -- ctor
  in coe -- lum re -- dis, re --
  _ dis cum
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    r2 r d
    e a,4 g a d
    d cis d2 r
    r4 a d d c d
    d c c2 r
  }
}

TenoreLyricsA = \lyricmode {
  Sa --
  lu -- tis hu -- ma -- nae
  sa -- _ tor,
  Je -- su, vo -- lu -- ptas
  cor -- di -- um,
}

TenoreLyricsB = \lyricmode {
  Per --
  rum -- pis in -- fer -- num
  cha -- _ os,
  vin -- ctis ca -- te -- nas
  de -- tra -- his,
}

TenoreLyricsC = \lyricmode {
  Je --
  su ti -- _ bi sit
  glo -- ri -- a,
  qui vi -- ctor in coe --
  lum re -- dis
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]" \autoBeamOff
    d2 g d
    a d4 e f4. g8
    a2 d, r
    r4 d8[ c] b[ c] d[ e] f4 d
    b c f, r r2
  }
}

BassoLyricsA = \lyricmode {
  Sa -- lu -- tis
  hu -- ma --_  nae __ _
  sa -- tor,
  Je -- su, vo -- lu -- ptas
  cor -- di -- um,
}

BassoLyricsB = \lyricmode {
  Per -- rum -- pis
  in -- fer -- _ num __ _
  cha -- os,
  vin -- ctis ca -- te -- nas
  de -- tra -- his,
}

BassoLyricsC = \lyricmode {
  Je -- su ti --
  bi sit __ _ glo -- _
  ri -- a,
  qui vi -- ctor_in coe -- lum
  re -- _ dis
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 3/2 \tempoMarkup "[no tempo]"
    d2 g4 g, d'2
    a d4 e f4. g8
    a2 d,4 \clef soprano << { a'' b8 c d e f4 } \\ {  f,8 e d e f g a4} >>
    \clef bass d,,8 c b c d e f4 d
    b c f, \clef soprano << { c''' d c } \\ { r4 r f, } >>
  }
}

BassFigures = \figuremode {
  r1.
  <4>4 <3> <6 5> <5> q <6>
  <6 4> <5 _+> r1
  r1.
  <6 5>
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
