\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Adagio"
    r4 f'4. e8 f4
    e2 a~
    a4 g g2
    r4 g a4. a8
    a g16 a b8 a gis gis a4~
    a gis a8 a, h gis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Adagio"
    r4 d'4. cis8 d4~
    d cis r f~
    f e8 d e2
    es2. d4
    d8 d4 d8 d4 c~
    c h a8 c, d h
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r4 d'4.^\tutti cis8 d4~
    d cis r f~
    f e8[ d] e2
    es2. d4
    d8 d4 d16 d d8 d c4~
    c h a r
  }
}

SopranoLyrics = \lyricmode {
  San -- _ _
  ctus, san --
  _ ctus,
  san -- _
  ctus Do -- mi -- nus De -- us Sa --
  ba -- oth.
}

Alto = {
  \relative c' {
    \clef alto
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r4 f4.^\tutti e8 f4
    e2 a~
    a4 g g g
    r g a4. a8
    a[ g] g[ a] gis gis a4~
    a gis a r
  }
}

AltoLyrics = \lyricmode {
  San -- _ _
  ctus, san --
  ctus, san -- ctus,
  san -- _ ctus,
  san -- ctus De -- us Sa --
  ba -- oth.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    r4 a^\tutti h2
    e, r4 c'
    d2. c4
    r c2 c4
    b! b8 d e4 fis
    e4. e8 e r r4
  }
}

TenoreLyrics = \lyricmode {
  San -- _
  ctus, san --
  _ ctus,
  san -- ctus
  Do -- mi -- nus De -- us
  Sa -- ba -- oth.
}

Basso = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Adagio"
    d4.^\tutti d8 gis2
    a r4 f
    h,2 c
    r4 c' fis,2
    g4 g8 f16 f e4 dis
    e4. e8 a,4 r
  }
}

BassoLyrics = \lyricmode {
  San -- ctus, san --
  ctus, san -- _
  ctus,
  san -- _
  ctus Do -- mi -- nus De -- us
  Sa -- ba -- oth.
}

Organo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Adagio"
    d2-\tutti gis
    a r4 f
    h,2 c
    r4 c fis2
    g4. f8 e4 dis
    e2 a,8 f' d e
  }
}

BassFigures = \figuremode {
  r2 <7 5>
  <5 4>4 <\t _+>2.
  <7 5>4 <6> <9> <8>
  r <_-> <7- 5> <6>
  <9>8 <8>4 <3>8 <7 _+>4 <7 5>
  <6 4> <5 _+>2 <6! 5>8 <_+>
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
