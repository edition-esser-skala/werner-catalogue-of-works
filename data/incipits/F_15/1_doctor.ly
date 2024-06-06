\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/2 \tempoMarkup "Allabreve assai"
      \set Staff.timeSignatureFraction = 2/2
    g'1 a2 h
    c a h c~
    c h a1
    g2 fis e2. e4
    d1 r
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key g \major \time 4/2 \tempoMarkup "Allabreve assai"
      \set Staff.timeSignatureFraction = 2/2
    r1 d
    e2 fis g e
    fis g1 fis2
    g r r1
    r r2 a
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/2 \tempoMarkup "Allabreve assai" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    g'1 a2 h
    c a h c
    c h a1
    g2 fis e2. e4
    d1 r
  }
}

SopranoLyricsA = \lyricmode {
  Do -- ctor e --
  gre -- gi -- e, do --
  _ ctor Pau --
  le, e -- gre -- gi --
  e,
}

SopranoLyricsB = \lyricmode {
  Sit Tri -- ni --
  ta -- ti sem -- pi --
  ter -- na glo --
  ri -- a, glo -- ri --
  a,
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/2 \tempoMarkup "Allabreve assai" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    r1 d
    e2 fis g e
    fis g1 fis2
    g r r1
    r r2 a
  }
}

AltoLyricsA = \lyricmode {
  Do --
  ctor e -- gre -- gi --
  e, Pau -- _
  le,
  et
}

AltoLyricsB = \lyricmode {
  Sit
  Tri -- ni -- ta -- ti
  glo -- _ ri --
  a,
  "ho -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/2 \tempoMarkup "Allabreve assai" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*3
    r2 a h cis
    d h cis d
  }
}

TenoreLyricsA = \lyricmode {
  Do -- ctor e --
  gre -- gi -- e, "Pau -"
}

TenoreLyricsB = \lyricmode {
  Sit Tri -- ni --
  ta -- ti "glo -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/2 \tempoMarkup "Allabreve assai" \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    R\breve*2
    r1 d
    e2 fis g e
    fis g1 fis2
  }
}

BassoLyricsA = \lyricmode {
  Do --
  ctor e -- gre -- gi --
  e, do -- ctor
}

BassoLyricsB = \lyricmode {
  Sit
  Tri -- ni -- ta -- ti
  "glo -"
}

Organo = {
  \relative c {
    \clef soprano
    \key g \major \time 4/2 \tempoMarkup "Allabreve assai"
      \set Staff.timeSignatureFraction = 2/2
    << {
      g''1 a2 h
      c a h c~
      c h
    } \\ {
      r1 d,
      e2 fis g e
      fis g
    } >> \clef bass d,1
    e2 fis g e
    fis g1 fis2
  }
}

BassFigures = \figuremode {
  r\breve
  r
  r1 <4>2 <_+>
  r1 <6>2 <8 6\\>
  <6> <3> <4\+> r
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
    \new ChoirStaff \with { \setGroupDistance #18 #18 } <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyricsA
      \new Lyrics \lyricsto Soprano \SopranoLyricsB

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyricsA
      \new Lyrics \lyricsto Alto \AltoLyricsB

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyricsA
      \new Lyrics \lyricsto Tenore \TenoreLyricsB

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyricsA
      \new Lyrics \lyricsto Basso \BassoLyricsB
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
