\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]"
    R1*4
    a'4. h8 c d e4
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]"
    R1
    d4. e8 f g a4
    b8 a g b a g f e
    d e f e16 d e8 f16 g a4~
    a8 g f e16 d c8 h a4
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*4
    a'4. h8 c[ d] e4
  }
}

SopranoLyricsA = \lyricmode {
  Je -- _ su "co -"
}

SopranoLyricsB = \lyricmode {
  An -- _ ni "re -"
}

SopranoLyricsC = \lyricmode {
  Pa -- _ tri "per -"
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1
    d4. e8 f[ g] a4
    b8[ a] g[ b] a[ g] f[ e]
    d[ e] f[ e16 d] e8[ f16 g] a4~
    a8 g f[ e16 d] c8 h a4
  }
}

AltoLyricsA = \lyricmode {
  Je -- _ su co --
  ro -- na cel -- si --
  or, co -- ro -- _
  na cel -- _ si -- or
}

AltoLyricsB = \lyricmode {
  An -- _ ni re --
  ver -- so tem -- po --
  re, re -- ver -- _
  so tem -- _ po -- re
}

AltoLyricsC = \lyricmode {
  Pa -- _ tri per --
  en -- nis glo -- ri --
  a, per -- en -- _
  nis glo -- _ ri -- a
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R1*3
    a4. h8 c[ d] e4
    f8[ e] d4 e8[ d] c[ h]
  }
}

TenoreLyricsA = \lyricmode {
  Je -- _ su co --
  ro -- na cel -- "si -"
}

TenoreLyricsB = \lyricmode {
  An -- _ ni re --
  ver -- so tem -- "po -"
}

TenoreLyricsC = \lyricmode {
  Pa -- _ tri per --
  en -- nis glo -- "ri -"
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    d4. e8 f[ g] a4
    b8[ a] g4 a8[ g] f[ e]
    d[ f] e[ d] cis4 d8[ e]
    f4 d a'8[ g f e]
    d4. d8 a2
  }
}

BassoLyricsA = \lyricmode {
  Je -- _ su co --
  ro -- na cel -- si --
  or, Je -- su co --
  ro -- na cel --
  _ si -- or
}

BassoLyricsB = \lyricmode {
  An -- _ ni re --
  ver -- so tem -- po --
  re, an -- ni re --
  ver -- so tem --
  _ po -- re
}

BassoLyricsC = \lyricmode {
  Pa -- _ tri per --
  en -- nis glo -- ri --
  a, Pa -- tri per --
  en -- nis glo -- ri --
  _ a
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "[no tempo]"
    d4.-! e8-! f-! g-! a4-!
    b8 a g4 a8 g f e
    d f e d cis4 d8 e
    f4 d a'8 g f e
    d2 a
  }
}

BassFigures = \figuremode {
  r1
  <3>8 <\t> <5> <6> q <8> <10> <\t>
  <6> <3> q <6> q2
  q4 <5>8 <6> <3>2
  <#(dotbf 5)>4. <6!>8 r2
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
