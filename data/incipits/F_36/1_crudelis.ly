\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key g \minor \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    r2 g' a h
    c b a2. a4
    g1 r
    r b
    a2 f g a
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key g \minor \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    d2 d d1
    c2 d es d
    d1 r
    es d2 b
    c d es1
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \minor \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    r2 g' a h
    c b a2. a4
    g1 r
    r b
    a2 f g a
  }
}

SopranoLyricsA = \lyricmode {
  Cru -- de -- lis
  He -- ro -- des De --
  um
  re --
  gem ve -- ni -- re
}

SopranoLyricsB = \lyricmode {
  I -- bant ma --
  gi quam vi -- de --
  rant
  stel --
  lam se -- quen -- tes
}

SopranoLyricsC = \lyricmode {
  Je -- su ti --
  bi sit glo -- ri --
  a
  qui~ap --
  pa -- ru -- i -- sti
}

Alto = {
  \relative c' {
    \clef alto
    \key g \minor \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    d2 d d1
    c2 d es d
    d1 r
    es d2 b
    c d es1
  }
}

AltoLyricsA = \lyricmode {
  Cru -- de -- lis
  He -- ro -- des De --
  um
  re -- gem ve --
  ni -- re quid
}

AltoLyricsB = \lyricmode {
  I -- bant ma --
  gi quam vi -- de --
  rant
  stel -- lam se --
  quen -- tes "prae -"
}

AltoLyricsC = \lyricmode {
  Je -- su ti --
  bi sit glo -- ri --
  a
  qui~ap -- pa -- ru --
  i -- sti "gen -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \minor \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    b2 b a d
    g, g1 fis2
    g b a f
    g a b g
    f1 c'2. c4
  }
}

TenoreLyricsA = \lyricmode {
  Cru -- de -- lis He --
  ro -- des De --
  um re -- gem ve --
  ni -- re quid ti --
  mes, quid "ti -"
}

TenoreLyricsB = \lyricmode {
  I -- bant ma -- gi
  quam vi -- de --
  rant stel -- lam se --
  quen -- tes prae -- vi --
  am, prae -- "vi -"
}

TenoreLyricsC = \lyricmode {
  Je -- su ti -- bi
  sit glo -- ri --
  a qui~ap -- pa -- ru --
  i -- sti gen -- ti --
  bus, gen -- "ti -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \minor \time 4/2 \tempoMarkup "[no tempo]" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    g2 \phrasingSlurDashed g'2.\( g4\) f2
    es d c d
    g, g' f! d
    c1 b
    R\breve
  }
}

BassoLyricsA = \lyricmode {
  Cru -- de -- lis He --
  ro -- des De -- _
  um re -- gem ve --
  ni -- re,

}

BassoLyricsB = \lyricmode {
  I -- bant __ _ ma --
  gi quam vi -- de --
  rant stel -- lam
  se -- quen -- tes,

}

BassoLyricsC = \lyricmode {
  Je -- su __ _ ti --
  bi sit glo -- ri --
  a qui~ap -- pa -- ru --
  i -- sti,

}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 4/2 \tempoMarkup "[no tempo]"
      \set Staff.timeSignatureFraction = 2/2
    g2 g'1 f2
    es d c d
    g, g' f! d
    c1 b2 \clef tenor g'
    f1 c'
  }
}

BassFigures = \figuremode {
  r2 <5 3> <\t 2> <4!>
  <6> <6 4> <6 5> <_+>
  r <3> q q
  <5 _-> <6>1 <6!>2
  <5> <6> <5> <6>
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
