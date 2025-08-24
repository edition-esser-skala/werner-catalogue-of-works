\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \tempoMarkup "Vivace"
    R1*2
    r8 a' a a c4 h8 cis
    d4. c8 h8. h16 a8 c
    d e f4. e8 d4
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \tempoMarkup "Vivace"
    R1
    r2 r8 e e e
    f4 e4. fis8 g!4
    fis8 gis a4. gis8 a e
    f g c, d g, g' fis g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    R1*2
    r8 a' a a c4 h8 cis
    d4. c8 h8. h16 a8 c
    d e f4 f8 e d4
  }
}

SopranoLyricsA = \lyricmode {
  De -- us tu -- o -- rum, tu --
  o -- rum mi -- li -- tum sors
  et co -- ro -- na, co -- "ro -"
}

SopranoLyricsB = \lyricmode {
  Poe -- nas cu -- cur -- rit, cu --
  cur -- rit for -- ti -- ter et
  su -- stu -- lit, su -- stu -- lit
}

SopranoLyricsC = \lyricmode {
  Je -- su ti -- bi sit, ti --
  bi sit glo -- ri -- a qui
  na -- tus es, na -- tus es
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    R1
    r2 r8 e e e
    f4 e4. fis8 g!4
    fis8[ gis] a4. gis8 a e
    f g c,[ d] g, g' fis g
  }
}

AltoLyricsA = \lyricmode {
  De -- us tu --
  o -- rum, tu -- o --
  rum mi -- li -- tum sors
  et co -- ro -- na, co -- ro \hy
}

AltoLyricsB = \lyricmode {
  Poe -- nas cu --
  cur -- rit, cu -- cur --
  rit for -- ti -- ter et
  su -- stu -- lit, et su -- stu -- lit
}

AltoLyricsC = \lyricmode {
  Je -- su ti --
  bi sit, ti -- bi
  sit glo -- ri -- a qui
  na -- tus, na -- tus es de "vir -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    r8 a a a c4 h~
    h8 cis d4. c8 h8. h16
    a8 a c4~ c8[ h16 a] g!4
    a8 h e,4 e8. e16 e4
    r8 h' a g g[ c] d[ g,]
  }
}

TenoreLyricsA = \lyricmode {
  De -- us tu -- o -- rum, __
  tu -- o -- rum mi -- li --
  tum, tu -- o -- rum,
  tu -- o -- rum mi -- li -- tum
  sors et co -- ro -- na
}

TenoreLyricsB = \lyricmode {
  Poe -- nas cu -- cur -- rit, __
  cu -- cur -- rit for -- ti --
  ter, cu -- cur -- rit
  for -- ti -- ter, for -- ti -- ter
  et su -- stu -- lit __ "vi -"
}

TenoreLyricsC = \lyricmode {
  Je -- su ti -- bi sit, __
  ti -- bi sit glo -- ri --
  a, ti -- bi __ sit,
  ti -- bi sit glo -- ri -- a
  qui na -- tus es __ de __
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    r2 r8 e e e
    g4 fis8[ gis] a4. gis8
    a4 r r8 a, e'4
    d8 h a a' e8. e16 a,4
    r8 g'! a h c4 c8 b
  }
}

BassoLyricsA = \lyricmode {
  De -- us tu --
  o -- rum mi -- li --
  tum, tu -- o --
  rum mi -- li -- tum, mi -- li -- tum
  sors et co -- ro -- na, "co -"
}

BassoLyricsB = \lyricmode {
  Poe -- nas cu --
  cur -- rit for -- ti --
  ter, cu -- cur --
  rit, cu -- cur -- rit for -- ti -- ter,
  et su -- stu -- lit, su -- "stu -"
}

BassoLyricsC = \lyricmode {
  Je -- su ti --
  bi sit glo -- ri --
  a, ti -- bi
  sit, ti -- bi sit glo -- ri -- a
  qui na -- tus es, na -- tus
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Vivace"
    << {
      r8 a' a a c4 h~
      h8 cis d4. c8
    } \\ {
      a,4 r r8 e' e e
      g4 fis8 gis a4. gis8
     } >>
    a2 a,4 e'
    d8 h a a' e4 a,
    r8 g'! a h c4. b8
  }
}

BassFigures = \figuremode {
  r1
  r2. <5 2>8 <\t \t>
  <6>4 <5> <5>8 <6\\> <5> <6\\>
  <_+> <6\\> <4> <3> <4> <_+>4.
  r8 <6> q <6 5> <4> <3> <4\+ 2> <6>
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
    \new ChoirStaff \with { \setGroupDistance #16 #18 } <<
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
