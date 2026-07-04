\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Adagio"
    %tacet
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Adagio"
    %tacet
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    d'4^\solo es2 es4
    d2 cis
    d8 c b a b4 b
    a b8 c d4 g,
    r8 es' es d cis cis d4~
    d cis d8 d, f a
  }
}

SopranoLyrics = \lyricmode {
  Sal -- _ ve
  Re -- gi --
  na, ma -- ter mi -- se -- ri --
  cor -- di -- ae, sal -- ve
  ma -- ter mi -- se -- ri -- cor --
  di -- ae, vi -- ta "dul -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1
    a'4^\solo g4. g8 fis[ e]
    fis a g \hA fis g4 g
    fis g8 a h8.[\trill a32 \hA h] c8[ b]
    as4 g2 f4
    e2\trill d4 r
  }
}

AltoLyrics = \lyricmode {
  Sal -- ve Re -- gi -- %2
  na, ma -- ter mi -- se -- ri --
  cor -- di -- ae, sal -- _
  _ ve Re --
  gi -- na,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r2 h4^\solo c~
    c b4. b8 a[ g]
    a4 r r8 es'! d cis
    d a d c h d c d
    es c4 d8 e4 d
    h a2 r4
  }
}

TenoreLyrics = \lyricmode {
  Sal -- _
  ve Re -- gi --
  na, ma -- ter mi --
  se -- ri -- cor -- di -- ae, mi -- se -- ri --
  cor -- di -- ae, sal -- ve,
  sal -- ve,
}

Basso = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    R1
    fis4^\solo g es2
    d4 r r2
    r8 c' b a g[ f] es[ d]
    c4. b8 a a' b a
    gis4 a d, r
  }
}

BassoLyrics = \lyricmode {
  Sal -- ve, sal -- %2
  ve
  ma -- ter mi -- se -- ri --
  cor -- di -- ae, mi -- se -- ri --
  cor -- di -- ae,
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Adagio"
    g'4-\solo r g r
    fis g es2
    d4 r r2
    r8 c' b a g f es d
    c4. b8 a a' b a
    gis4 a d, r
  }
}

BassFigures = \figuremode {
  <5>4 <6-> <6- _!> <\t 4>
  <6 5>2 <6\\ 5->4 <_ 4>8 <_ 3>
  <_+>1
  r8 <6 4\+> <6>4 <_!> <6>8 <6>
  <6->4 <5> <7 _+> <5>
  <6 5> <_+>2.
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
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
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
