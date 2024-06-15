\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Moderato"
    g''8. g16 g8 g e a
    g8. g16 g8 g e fis
    g4 r8 h h h
    a a h8. a16 g8 g
    g4 fis8 fis16 g a8 fis
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Moderato"
    h'8. c16 d8 h c a
    h8. c16 d8 h c a
    h h e4. d8
    cis d h8. h16 cis8 d
    e4 a,8 a d8. cis16
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Moderato"
    h'8.^\tutti c16 d8 h c a
    h h16[ c] d8 h c a
    h h e4. d8
    cis d h8. h16 cis8 d
    e4 a,8 a d cis
  }
}

SopranoLyrics = \lyricmode {
  Do -- mi -- ne, pro -- ba -- sti
  me, et co -- gno -- vi -- sti
  me, tu co -- gno --
  vi -- sti ses -- si -- o -- nem
  me -- am et re -- "sur -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Moderato"
    g'8.^\tutti g16 g8 g e fis
    d g g g e fis
    g4 r8 g g g
    a a g8. g16 g8 g
    g4 fis8 fis16[ g] a8 fis
  }
}

AltoLyrics = \lyricmode {
  Do -- mi -- ne, pro -- ba -- sti
  me, et co -- gno -- vi -- sti
  me, tu co -- gno --
  vi -- sti ses -- si -- o -- nem
  me -- am et re -- "sur -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Moderato"
    d8.^\tutti d16 d8 d c d
    d d d d c d
    d4 r8 h h h
    a a h8. h16 h8 h
    h[ a] a a a a
  }
}

TenoreLyrics = \lyricmode {
  Do -- mi -- ne, pro -- ba -- sti
  me, et co -- gno -- vi -- sti
  me, tu co -- gno --
  vi -- sti ses -- si -- o -- nem
  me -- am et re -- "sur -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 3/4 \autoBeamOff \tempoMarkup "Moderato"
    g'8.^\tutti a16 h8 g a fis
    g g16[ a] h8 g a d,
    g4 r8 g g g
    g fis g8. fis16 e8 d
    d[ cis] d d16[ e] fis8 d
  }
}

BassoLyrics = \lyricmode {
  Do -- mi -- ne, pro -- ba -- sti
  me, et co -- gno -- vi -- sti
  me, tu co -- gno --
  vi -- sti ses -- si -- o -- nem
  me -- am et re -- "sur -"
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 3/4 \tempoMarkup "Moderato"
    g'8.-\tutti a16 h8 g a fis
    g g16 a h8 g a d,
    g g, r g' g g
    g fis g8. fis16 e8 d~
    d cis d d16 e fis8 d
  }
}

BassFigures = \figuremode {
  r2.
  r2 r8 <7>
  r2.
  <2>8 <6> r2
  <2>2.
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
