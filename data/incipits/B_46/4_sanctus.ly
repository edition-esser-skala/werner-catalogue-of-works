\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Allegro"
    d'4. h8 g a h c
    d e16 d c8 d e d h cis
    d c h4 a4. d8
    h g r4 r2
    r r4 e'~
    e8 c a h c d e fis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Allegro"
    r4 g'4. fis8 d e
    fis g a g e fis g e
    fis a4 g fis16 e fis4
    g r r2
    R1
    a4. g!8 e fis! g a
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    d'4.^\tutti h8 g[ a h c]
    d[ e16 d] c8[ d] e[ d h cis]
    d[ c] h4 a4. d8
    h g r4 r2
    r r4 e'~
    e8[ c a h] c[ d e fis]
  }
}

SopranoLyrics = \lyricmode {
  San -- _ _
  _ _ _
  _ ctus, san -- ctus,
  san -- ctus,
  san --
  \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    r4 g'4.^\tutti fis8[ d e]
    fis[ g a g] e[ fis g e]
    fis a4 g fis16[ e] fis4
    g r r2
    R1
    a4. g!8 e[ fis! g a]
  }
}

AltoLyrics = \lyricmode {
  San -- _
  _ _
  _ _ _ _ _
  ctus,

  san \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    R1*2
    r2 r4 d~^\tutti
    d8[ h g a] h[ c] d[ e16 d]
    c8[ h] a4. gis16[ fis] \hA gis4
    a r r2
  }
}

TenoreLyrics = \lyricmode {
  San --
  _ _
  _ _ _ _
  ctus,
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    R1*3
    g'4.^\tutti fis8 d[ e fis gis]
    a[ g] f[ e16 d] e4. d16[ e]
    c8 a r4 r2
  }
}

BassoLyrics = \lyricmode {
  San -- _ _
  _ _ _ _
  _ ctus,
}

Organo = {
  \relative c {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "Allegro"
    << {
      d''4. h8 g a h c
      d e16 d c8 d e d h cis
      d c h4 a
    } \\ {
      r4 g4. fis8 d e
      fis g a g e fis g e
      fis a4 g fis16[ e]
    } >> \clef tenor d4
    \clef bass g,4. fis8 d e fis gis
    a g f e16 d e2
    a,4 \clef soprano << { a''8 h c d e fis } \\ { a,8 g! e fis! g a } >>
  }
}

BassFigures = \figuremode {
  r1
  r
  r2. <_+>4
  r2 <6>8 q q q
  <3> q4. <4>4 <_+>
  <8>1
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
